# Run LNMP on Kubernetes

* [问题反馈](https://github.com/khs1994-docker/lnmp/issues/122)

* **Windows** 用户务必安装 `WSL`

## Kubernetes 基础设施

* [自己手动部署 Kubernetes 集群(CoreOS)](https://github.com/khs1994-docker/coreos-kubernetes)

* [Docker Desktop](https://github.com/khs1994-docker/lnmp-k8s/blob/dev/docs/docker-desktop.md)

* [MiniKube](docs/minikube.md)

## DashBoard

```bash
$ cd kubernetes

$ kubectl apply -f coreos-kubernetes/kubernetes/addons/dashboard.yaml

$ kubectl proxy
```

浏览器打开 http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

## 部署 lnmp

```bash
$ cd kubernetes

$ ./lnmp-k8s deploy
```

## 删除 lnmp

```bash
$ ./lnmp-k8s cleanup
```

## Windows 10

Please see https://github.com/khs1994-docker/lnmp-k8s/blob/dev/docs/windows.md

## More Information

* [feiskyer/kubernetes-handbook](https://github.com/feiskyer/kubernetes-handbook)
