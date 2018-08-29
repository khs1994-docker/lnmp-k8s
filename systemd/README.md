# 使用 systemd 部署单节点 Kubernetes 集群

## 关闭防火墙

```bash
$ sudo systemctl stop firewalld && systemctl disable firewalld
```

刚开始搭建的时候，出现 pod 网络不通的情况，可以尝试关闭防火墙

## 替换

* `192.168.199.100` 替换为电脑 IP 或公有云主机公网 IP

* `node1` 替换为 hostname

## 修改 hostname

hostname 与 etcd 启动时指定的 `--name` 必须一致

```bash
$ hostnamectl set-hostname node1
```
