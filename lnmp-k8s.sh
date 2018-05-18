#!/usr/bin/env bash

KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release"

print_help_info(){
  echo "Usage:	$0 COMMAND

Commands:
  kubectl-install
  kubectl-getinfo

  deploy
  cleanup

"
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
esac
