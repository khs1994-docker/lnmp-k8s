$command, $arg = $args

switch ($command) {
  kubectl {
    C:\bin\kubectl --kubeconfig $PSScriptRoot\..\certs\kubectl.kubeconfig $arg
  }
  crictl {
    wsl -d wsl-k8s -u root -- crictl $arg
  }

  crictl-crio {
    wsl -d wsl-k8s -u root -- crictl --config /wsl/wsl-k8s-data/k8s/etc/crictl.yaml $arg
  }
  Default {
    Write-Host "

kubectl
crictl
crictl-crio
"
  }
}
