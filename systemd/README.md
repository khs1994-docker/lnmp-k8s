# 使用 systemd 部署单节点 Kubernetes 集群

## 替换

* `192.168.199.100` 替换为电脑 IP 或共有云主机公网 IP

* `node1` 替换为 hostname

## 修改 hostname

hostname 与 etcd 启动时指定的 `--name` 必须一致

```bash
$ hostnamectl set-hostname node1
```
