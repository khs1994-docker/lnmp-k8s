# Run LNMP on Kubernetes

* [问题反馈](https://github.com/khs1994-docker/lnmp/issues/122)

* **Windows** 用户务必安装 `WSL`

## Kubernetes 基础设施

* [自己手动部署 Kubernetes 集群(CoreOS)](https://github.com/khs1994-docker/coreos-kubernetes)

* [Docker Desktop](https://github.com/khs1994-docker/lnmp-k8s/blob/dev/docs/docker-desktop.md)

* [MiniKube](docs/minikube.md)

* [腾讯云 实验室免费体验 8 小时（可循环） 产品->容器服务->免费实验室 ](https://cloud.tencent.com/redirect.php?redirect=1005&cps_key=3a5255852d5db99dcd5da4c72f05df61&from=console)

## DashBoard

```bash
$ cd kubernetes

$ kubectl apply -f coreos-kubernetes/kubernetes/addons/dashboard.yaml

$ kubectl proxy
```

浏览器打开 http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

## 部署 LNMP

```bash
$ cd kubernetes

$ ./lnmp-k8s create
```

## 停止 LNMP

保留数据

```bash
$ ./lnmp-k8s delete
```

## 删除 LNMP

销毁所有数据

```bash
$ ./lnmp-k8s cleanup
```

## 数据持久化

请查看 [data](docs/data.md)

## Windows 10

Please see https://github.com/khs1994-docker/lnmp-k8s/blob/dev/docs/windows.md

## More Information

* [feiskyer/kubernetes-handbook](https://github.com/feiskyer/kubernetes-handbook)
