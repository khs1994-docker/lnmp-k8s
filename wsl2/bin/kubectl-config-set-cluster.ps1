<#
.SYNOPSIS
  Add wsl-k8s config to ~/.kube/config
.DESCRIPTION
  Add wsl-k8s config to ~/.kube/config
.EXAMPLE


.INPUTS

.OUTPUTS

.NOTES

#>

. $PSScriptRoot/../.env.example.ps1
. $PSScriptRoot/../.env.ps1

$kubeconfig = "$HOME/.kube/config"

# $kubeconfig="$PSScriptRoot/kubectl.kubeconfig"

kubectl config set-cluster wsl2 `
  --certificate-authority=$PSScriptRoot/../certs/ca.pem `
  --embed-certs=true `
  --server=${KUBE_APISERVER} `
  --kubeconfig=$kubeconfig

kubectl config set-credentials wsl2-admin `
  --client-certificate=$PSScriptRoot/../certs/admin.pem `
  --client-key=$PSScriptRoot/../certs/admin-key.pem `
  --embed-certs=true `
  --kubeconfig=$kubeconfig

kubectl config set-context wsl2 `
  --cluster=wsl2 `
  --user=wsl2-admin `
  --kubeconfig=$kubeconfig

kubectl config get-contexts

kubectl config use-context wsl2

kubectl config get-contexts

