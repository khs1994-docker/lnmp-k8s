# Run LNMP on Kubernetes

> 本项目是 [khs1994-docker/lnmp](https://github.com/khs1994-docker/lnmp) 的子项目，为避免软件配置文件重复，建议在 khs1994-docker/lnmp 中使用，不要单独使用本项目

* [问题反馈](https://github.com/khs1994-docker/lnmp/issues/122)

* **Windows** 用户务必安装 `WSL`

* 本项目不建议新手使用(想用的话也可以,请积极在 Issues 反馈),本项目的目标是超大规模 Kubernetes LNMP 集群(首要考虑的是跨节点问题)

## Kubernetes 基础设施

* [自己手动部署 Kubernetes 集群(CoreOS)](https://github.com/khs1994-docker/coreos-kubernetes)

* [Docker Desktop](https://github.com/khs1994-docker/lnmp-k8s/blob/dev/docs/docker-desktop.md)

* [MiniKube](docs/minikube.md)

* [腾讯云 实验室免费体验 8 小时（可循环） 产品->容器服务->免费实验室 ](https://cloud.tencent.com/redirect.php?redirect=1005&cps_key=3a5255852d5db99dcd5da4c72f05df61&from=console)

## 注意事项

* 本项目是给大家提供一个 lnmp k8s yaml 文件的模板,具体内容还请根据实际情况自行更改

* 本项目专为 Laravel 设计，能够完美的在 Kubernetes 之上运行 Laravel

* Docker 桌面版运行 Laravel 响应慢

* Linux 版本优先考虑多节点方案,所以 `pv` 采用 `NFS` 卷,而不是 `hostPath`(执行 `$ lnmp-docker nfs` 可以快速的启动 NFS 服务端 )

* Docker 桌面版不支持启动 NFS 服务端容器，若需 NFS 卷，请自行在 Linux 上部署 NFS 容器

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
