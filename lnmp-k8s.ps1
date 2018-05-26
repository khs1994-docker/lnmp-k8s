Function print_help_info(){
  echo "

Usage: lnmp-k8s.ps1 COMMAND

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

$MINIKUBE_VERSION="0.27.0"

################################################################################

if ($args.length -eq 0){
  print_help_info
  exit
}

$KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release"

switch ($args[0])
{
  "kubectl-install" {
    $KUBECTL_VERSION=$(wsl curl storage.googleapis.com/kubernetes-release/release/stable.txt)

    wsl curl -L ${KUBECTL_URL}/${KUBECTL_VERSION}/bin/windows/amd64/kubectl.exe -o kubectl-Windows-x86_64.exe

    echo "
Move kubectl-Windows-x86_64.exe to your PATH, then rename it kubectl
    "
  }

  "kubectl-getinfo" {
    $KUBECTL_VERSION=$(wsl curl storage.googleapis.com/kubernetes-release/release/stable.txt)

    echo "Latest Stable Version is: $KUBECTL_VERSION
    "
  }

  "deploy" {
    kubectl create -f deployment/lnmp-volumes.yaml

    kubectl create -f deployment/lnmp-env.yaml

    kubectl create secret generic lnmp-mysql-password --from-literal=password=mytest

    kubectl create -f deployment/lnmp-mysql.yaml

    kubectl create -f deployment/lnmp-redis.yaml

    kubectl create -f deployment/lnmp-php7.yaml

    kubectl create -f deployment/lnmp-nginx.yaml
  }

  "cleanup" {
    kubectl delete deployment -l app=lnmp

    kubectl delete service -l app=lnmp

    kubectl delete pvc -l app=lnmp

    kubectl delete pv lnmp-mysql-data lnmp-redis-data lnmp-data lnmp-nginx-conf

    kubectl delete secret lnmp-mysql-password

    kubectl delete configmap lnmp-env
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

}
