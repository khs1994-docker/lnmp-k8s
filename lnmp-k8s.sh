#!/usr/bin/env bash

KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release"

set -ex

os=`uname -s`

print_help_info(){
  echo "

Usage: lnmp-k8s.sh COMMAND

Commands:
  kubectl-install    Install kubectl
  kubectl-getinfo    Get kubectl latest version info

  minikube-install   Install minikube
  minikube           Start minikube

  deploy             deploy lnmp on k8s
  cleanup            stop lnmp on k8s

"
}

################################################################################

MINIKUBE_VERSION=0.27.0

################################################################################

_minikube(){
  if [ `uname -s` = 'Darwin' ];then
    minikube start \
      -v 10 \
      --registry-mirror=https://registry.docker-cn.com \
      --vm-driver="hyperkit" \
      --memory=4096
  else
    minikube start \
      -v 10 \
      --registry-mirror=https://registry.docker-cn.com \
      --vm-driver="none"
  fi
}

_minikube-install(){
  if [ $os = 'Linux' ];then
    url=http://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/releases/v${MINIKUBE_VERSION}/minikube-linux-amd64
  elif [ $os = 'Darwin' ];then
    url=http://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/releases/v${MINIKUBE_VERSION}/minikube-darwin-amd64
  fi

  curl -L $url -o minikube

  chmod +x minikube

  echo "
  move minikube to your PATH"
}

_cleanup(){

kubectl delete deployment -l app=lnmp

kubectl delete service -l app=lnmp

kubectl delete pvc -l app=lnmp

kubectl delete pv lnmp-mysql-data lnmp-redis-data lnmp-data lnmp-nginx-conf

kubectl delete secret lnmp-mysql-password

kubectl delete configmap lnmp-env
}

_deploy(){

  kubectl create -f lnmp-volumes.yaml

  kubectl create -f lnmp-env.yaml

  kubectl create secret generic lnmp-mysql-password --from-literal=password=mytest

  kubectl create -f lnmp-mysql.yaml

  kubectl create -f lnmp-redis.yaml

  kubectl create -f lnmp-php7.yaml

  kubectl create -f lnmp-nginx.yaml
}

kubectl-install(){
  KUBECTL_VERSION=$(curl https://storage.googleapis.com/kubernetes-release/release/stable.txt)

  curl -L ${KUBECTL_URL}/${KUBECTL_VERSION}/bin/linux/amd64/kubectl > kubectl-Linux-x86_64
  curl -L ${KUBECTL_URL}/${KUBECTL_VERSION}/bin/darwin/amd64/kubectl > kubectl-Darwin-x86_64
}

kubectl-getinfo(){
  echo "kubectl latest version is
  "
  curl https://storage.googleapis.com/kubernetes-release/release/stable.txt
}

if [ -z "$1" ];then
  print_help_info
  exit
fi

case $1 in
    kubectl-install )
      kubectl-install
    ;;
    kubectl-getinfo )
      kubectl-getinfo
    ;;

    deploy )
      _deploy
    ;;

    cleanup )
      _cleanup
    ;;

    minikube )
      _minikube
    ;;

    minikube-install )
      _minikube-install
    ;;
esac
