cd $PSScriptRoot

$current_context=kubectl config current-context

if (!($current_context -eq "docker-for-desktop")){
   Write-Warning "This Script Support Docker for Desktop Only"
   exit
}

Function print_help_info(){
  echo "

Usage: lnmp-k8s.ps1 COMMAND

Commands:
  kubectl-install    Install kubectl
  kubectl-getinfo    Get kubectl latest version info

  minikube-install   Install minikube
  minikube           Start minikube

  create             Deploy lnmp on k8s
  delete             Stop lnmp on k8s, keep data resource(pv and pvc)
  cleanup            Stop lnmp on k8s, and remove all resource(pv and pvc)

  registry           Up Registry

  create-pv          Create PV and PVC

  dashboard          How to open Dashboard

"
}

################################################################################

$MINIKUBE_VERSION="0.28.1"

################################################################################

if ($args.length -eq 0){
  print_help_info
  exit
}

$KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release"

Function get_kubectl_version(){
  return $KUBECTL_VERSION=$(wsl curl https://storage.googleapis.com/kubernetes-release/release/stable.txt)
}

Function _delete(){
  kubectl delete deployment -l app=lnmp
  kubectl delete service -l app=lnmp
  kubectl delete secret -l app=lnmp
  kubectl delete configmap -l app=lnmp
  kubectl delete cronjob -l app=lnmp
}

Function _create_pv(){
  Get-Content deployment/lnmp-volume.windows.example.yaml `
      | %{Write-Output $_.Replace("/Users/username","/Users/$env:username")} `
      | kubectl create -f -

  kubectl create -f deployment/lnmp-pvc.yaml
}

Function _registry(){
  kubectl create configmap lnmp-registry-conf-0.0.1 --from-file=config.yml=../config/registry/config.gcr.io.yml
  kubectl label configmap lnmp-registry-conf-0.0.1 app=lnmp version=0.0.1

  kubectl create secret generic lnmp-registry-tls-0.0.1 --from-file=../config/registry/gcr.io.crt \
      --from-file=../config/registry/gcr.io.key
  kubectl label secret lnmp-registry-tls-0.0.1 app=lnmp version=0.0.1

  kubectl create -f coreos/deployment/addons/registry.yaml
}

switch ($args[0])
{
  "kubectl-install" {
    $KUBECTL_VERSION=get_kubectl_version
    wsl curl -L ${KUBECTL_URL}/${KUBECTL_VERSION}/bin/windows/amd64/kubectl.exe -o kubectl-Windows-x86_64.exe

    echo "
Move kubectl-Windows-x86_64.exe to your PATH, then rename it kubectl
    "
  }

  "kubectl-getinfo" {
    $KUBECTL_VERSION=get_kubectl_version
    echo "Latest Stable Version is: $KUBECTL_VERSION
    "
  }

  "create" {
    _create_pv

    kubectl create -f deployment/lnmp-configMap.yaml

    kubectl create configmap lnmp-nginx-conf-d-0.0.1 --from-file=deployment/configMap/nginx-conf-d
    kubectl label configmap lnmp-nginx-conf-d-0.0.1 app=lnmp version=0.0.1

    kubectl create configmap lnmp-php-conf-0.0.1 `
      --from-file=php.ini=../config/php/php.development.ini `
      --from-file=../config/php/docker-xdebug.ini `
      --from-file=../config/php/zz-docker.production.conf `
      --from-file=composer.config.json=../config/composer/config.json
    kubectl label configmap lnmp-php-conf-0.0.1 app=lnmp version=0.0.1

    kubectl create configmap lnmp-mysql-cnf-0.0.1 `
     --from-file=../config/mysql/docker.production.cnf
    kubectl label configmap lnmp-mysql-cnf-0.0.1 app=lnmp version=0.0.1

    kubectl create configmap lnmp-nginx-conf-0.0.1 `
     --from-file=../config/etc/nginx/nginx.conf
    kubectl label configmap lnmp-nginx-conf-0.0.1 app=lnmp version=0.0.1

    # kubectl create secret generic lnmp-mysql-password --from-literal=password=mytest

    kubectl create -f deployment/lnmp-secret.yaml

    kubectl create -f deployment/lnmp-mysql.yaml

    kubectl create -f deployment/lnmp-redis.yaml

    kubectl create -f deployment/lnmp-php7.yaml

    kubectl create -f deployment/lnmp-nginx.service.yaml

    kubectl create -f deployment/lnmp-nginx.yaml
  }

  "delete" {
    _delete
  }

  "cleanup" {
    _delete

    kubectl delete pvc -l app=lnmp
    kubectl delete pv -l app=lnmp
    kubectl delete ingress -l app=lnmp
  }

  "registry" {
    _create_pv
    _registry
  }

  "create-pv" {
    _create_pv
  }

  "minikube" {
    minikube.exe start `
      --hyperv-virtual-switch="minikube" `
      -v 10 `
      --registry-mirror=https://registry.docker-cn.com `
      --vm-driver="hyperv" `
      --memory=4096
  }

  "minikube-install" {
    wsl curl -L `
      http://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/releases/v${MINIKUBE_VERSION}/minikube-windows-amd64.exe `
      -o minikube.exe
  }

  "dashboard" {
    echo "
$ kubectl proxy

open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

"
  }

}
