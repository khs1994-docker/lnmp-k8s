#!/usr/bin/env bash

set -ex

echo "==> Set app"
# mkdir -p ../app/laravel/public
# cp lnmp/app/index.php ../app/laravel/public/

sudo mkdir -p /nfs/lnmp/app/laravel/public
sudo cp lnmp/app/index.php /nfs/lnmp/app/laravel/public/

echo "==> Up nfs server"
# if ! [ $(go env GOARCH) = 'amd64' ];then
#   sudo sed -i "s/erichough/klutchell/g" nfs-server/docker-compose.yml
# fi
# ./lnmp-k8s nfs
# sudo modprobe {nfs,nfsd,rpcsec_gss_krb5} || true
# sudo modprobe nfsd || true
kubectl apply -k deploy/nfs-server
sleep 30
kubectl logs $(kubectl get pod -l app=nfs-server --no-headers | cut -d ' ' -f 1) || true
# docker ps -a
# ./lnmp-k8s nfs logs
kubectl get all
sudo mkdir -p /tmp2
# install nfs dep
sudo apt install -y nfs-common
# sudo mount -t nfs4 -v ${SERVER_IP}:/lnmp/log /tmp2
sudo mount -t nfs4 -v 10.254.0.49:/lnmp/log /tmp2
sudo umount /tmp2

echo "==> set LNMP_NFS_SERVER_HOST .env"
# sed -i "s#192.168.199.100#${SERVER_IP}#g" .env

echo "==> Test LNMP with NFS"
cd lnmp
# kubectl kustomize storage/pv/nfs | sed "s/10.254.0.49/${SERVER_IP}/g" | kubectl apply -f -
kubectl apply -k storage/pv/nfs
kubectl create ns lnmp
kubectl apply -k storage/pvc/nfs -n lnmp
kubectl apply -k redis/overlays/development -n lnmp
if [ $(go env GOARCH) = 'amd64' ];then
  kubectl apply -k mysql/overlays/development -n lnmp
else
  kubectl apply -k mariadb/overlays/development -n lnmp
fi
kubectl apply -k php/overlays/development -n lnmp
kubectl apply -k nginx/overlays/development -n lnmp
kubectl apply -k nginx/overlays/nodePort-80-443 -n lnmp
cd ..
echo "${SERVER_IP} laravel2.t.khs1994.com" | sudo tee -a /etc/hosts
ping -c 1 laravel2.t.khs1994.com || nslookup laravel2.t.khs1994.com
sleep 120
kubectl get -n lnmp all
curl -k https://laravel2.t.khs1994.com
sudo ps aux || true
kubectl delete ns lnmp
kubectl delete pv -l app=lnmp
# ./lnmp-k8s nfs down
kubectl delete -k deploy/nfs-server

echo "==> Test LNMP with hostpath"
# cp -rf ../app ~/app-development
cp -rf /nfs/lnmp/app ~/app-development
cd lnmp
kubectl kustomize storage/pv/linux | sed "s/__USERNAME__/$(whoami)/g" | kubectl apply -f -
kubectl create ns lnmp
kubectl apply -k storage/pvc/hostpath -n lnmp
kubectl apply -k redis/overlays/development -n lnmp
if [ $(go env GOARCH) = 'amd64' ];then
  kubectl apply -k mysql/overlays/development -n lnmp
else
  kubectl apply -k mariadb/overlays/development -n lnmp
fi
kubectl apply -k php/overlays/development -n lnmp
kubectl apply -k nginx/overlays/development -n lnmp
kubectl apply -k nginx/overlays/nodePort-80-443 -n lnmp
cd ..
sleep 50
kubectl get -n lnmp all
curl -k https://laravel2.t.khs1994.com

echo "==> Test runtimeclass runsc"
test -z "${LNMP_K8S_LOCAL_INSTALL_OPTIONS}" && (kubectl apply -f demo/runtimeClass/containerd/runtimeClass.yaml && kubectl apply -f demo/runtimeClass/runsc.yaml) || true
test "${LNMP_K8S_LOCAL_INSTALL_OPTIONS}" = "--crio" && (kubectl apply -f demo/runtimeClass/cri-o/runtimeClass.yaml && kubectl apply -f demo/runtimeClass/runsc.yaml) || true
test "${LNMP_K8S_LOCAL_INSTALL_OPTIONS}" = "--docker" && docker run -it --rm --runtime=runsc alpine uname -a || true
test "${LNMP_K8S_LOCAL_INSTALL_OPTIONS}" = "--docker" && docker run -it --rm alpine uname -a || true
sleep 20
kubectl get all
kubectl get pod
POD_NAME=`kubectl get pod | awk '{print $1}' | tail -1` || true
kubectl exec ${POD_NAME} -- uname -a || true
kubectl describe pod/${POD_NAME} || true

echo "==> Test runtimeclass runc"
kubectl delete -f demo/runtimeClass/runsc.yaml || true
test -z "${LNMP_K8S_LOCAL_INSTALL_OPTIONS}" && (kubectl apply -f demo/runtimeClass/runc.yaml) || true
test "${LNMP_K8S_LOCAL_INSTALL_OPTIONS}" = "--crio" && (kubectl apply -f demo/runtimeClass/runc.yaml) || true
sleep 10
kubectl get all
kubectl get pod
POD_NAME=`kubectl get pod | awk '{print $1}' | tail -1` || true
kubectl exec ${POD_NAME} -- uname -a || true
kubectl describe pod/${POD_NAME} || true
