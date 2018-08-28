# 使用 systemd 部署单节点 Kubernetes 集群

## 修改 hostname

hostname 与 etcd 启动时指定的 `--name` 必须一致

```bash
$ hostnamectl set-hostname node1
```
