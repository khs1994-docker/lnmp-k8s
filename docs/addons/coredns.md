# 部署 CoreDNS 插件

```bash
$ cd deployment

$ kubectl create -f addons/coredns.yaml

$ kubectl get all -n kube-system
```

## Test

```bash
$ kubectl create -f my-nginx.yaml

$ kubectl expose deploy my-nginx

$ kubectl get services --all-namespaces |grep my-nginx

default       my-nginx               ClusterIP   10.254.118.177   <none>        80/TCP          12s

$ kubectl create -f pod-nginx.yaml

$ kubectl exec nginx -i -t -- /bin/sh

root@nginx:/# cat /etc/resolv.conf

root@nginx:/# ping my-nginx
```
