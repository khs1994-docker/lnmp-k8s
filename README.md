# Run LNMP on Kubernetes

> 本项目是 [khs1994-docker/lnmp](https://github.com/khs1994-docker/lnmp) 的子项目，为避免软件配置文件重复，建议在 khs1994-docker/lnmp 中使用，不要单独使用本项目

* [问题反馈](https://github.com/khs1994-docker/lnmp/issues/122)

* **Windows** 用户务必安装 `WSL`

* 本项目的目标是超大规模 Kubernetes LNMP 集群(首要考虑的是跨节点问题)

## Kubernetes 基础设施(从 0 开始搭建 Kubernetes 集群)

* [自己手动部署 Kubernetes 集群(CoreOS)](coreos)

* [Linux 单机部署](systemd)

* [Docker Desktop](docs/docker-desktop.md)

* [MiniKube](docs/minikube.md)

* [腾讯云 实验室免费体验 8 小时（可循环） 产品->容器服务->免费实验室 ](https://cloud.tencent.com/redirect.php?redirect=1005&cps_key=3a5255852d5db99dcd5da4c72f05df61&from=console)

## 注意事项

* `lnmp-k8s` 脚本在 Windows 或 macOS 上执行的 k8s 目标集群为 **Docker 桌面版启动的 k8s 集群**，未考虑在 Windows 或 macOS 操作 **远程 k8s 集群** 的情况。（相信有能力操作远程集群的人群不再需要本项目的一键脚本）

* 本项目是给大家提供一个 lnmp k8s yaml 文件的模板，具体内容还请根据实际情况自行更改

* 本项目专为 Laravel 设计，能够完美的在 Kubernetes 之上运行 Laravel

* Docker 桌面版 K8s 运行 Laravel 响应慢

* Linux 版本优先考虑多节点方案,所以 `pv` 采用 `NFS` 卷,而不是 `hostPath`(执行 `$ lnmp-docker nfs` 可以快速的启动 NFS 服务端 )

* Docker 桌面版不支持启动 NFS 服务端容器，若需 NFS 卷，请自行在 Linux 上部署 NFS 容器

* 由于虚拟机模拟集群环境硬盘空间占用太大，又不能及时回收，所以本项目支持在 Linux 单机上部署 Kubernetes (通过 systemd 管理)`$ lnmp-k8s single-install`

## 部署 LNMP

```bash
$ cd kubernetes

$ ./lnmp-k8s create
```

## PHP 项目开发

```bash
$ cd ~/lnmp/app

$ mkdir my-project

# 在新建的文件夹内进行 PHP 项目开发

# 配置 NGINX
$ cd ~/lnmp/kubernetes/deployment/configMap/nginx-conf-d

# 新建文件(文件后缀名必须为 conf)或将新增配置追加到已有文件中

$ vi filename.conf

# 创建新版本的 configmap
$ kubectl crea·te configmap lnmp-nginx-conf-d-0.0.2 --from-file deployment/configMap/nginx-conf-d

$ kubectl label configmap lnmp-nginx-conf-d-0.0.2 app=lnmp version=0.0.2

$ kubectl edit deployment nginx

# 更新配置信息，保存文件即可。
```

## 停止 LNMP

保留数据

```bash
$ ./lnmp-k8s delete
```

## 销毁 LNMP

销毁所有数据

```bash
$ ./lnmp-k8s cleanup
```

## 资源占用

* `Core DNS` + `Dashboard` + `Heapster` + `Metrics Server` + `EFK` + `LNMP`

```bash
NAME      CPU(cores)   CPU%      MEMORY(bytes)   MEMORY%
coreos1   217m         21%       1710Mi          58%
coreos2   249m         24%       2258Mi          77%
coreos3   267m         26%       2353Mi          81%
```

## 网络出错

清理 `iptables` 规则

* https://blog.csdn.net/shida_csdn/article/details/80028905

```bash
$ systemctl stop kubelet
$ systemctl stop docker

$ iptables --flush
$ iptables -tnat --flush

$ systemctl start kubelet
$ systemctl start docker
```

```bash
$ systemctl stop firewalld && systemctl disable firewalld
$ /usr/sbin/iptables -F && /usr/sbin/iptables -X && /usr/sbin/iptables -F -t nat && /usr/sbin/iptables -X -t nat
$ /usr/sbin/iptables -P FORWARD ACCEPT
$ systemctl daemon-reload && systemctl enable docker && systemctl restart docker
$ for intf in /sys/devices/virtual/net/docker0/brif/*; do echo 1 > $intf/hairpin_mode; done
$ sudo sysctl -p /etc/sysctl.d/kubernetes.conf
```

## Tips

* [数据持久化](docs/data.md)

* [Windows 10](docs/windows.md)

* [滚动升级 不停机更新](docs/rollout.md)

## More Information

* [feiskyer/kubernetes-handbook](https://github.com/feiskyer/kubernetes-handbook)
