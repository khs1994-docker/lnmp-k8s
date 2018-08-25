# Docker for Desktop Kubernetes Ingress NGINX

* https://kubernetes.github.io/ingress-nginx/

## 部署

```bash
$ kubectl apply -f coreos-kubernetes/kubernetes/addons/ingress-nginx/ingress-nginx.yaml

$ kubectl apply -f coreos-kubernetes/kubernetes/addons/ingress-nginx/cloud-generic.yaml
```

## 定义规则

```bash
$ kubectl apply -f coreos-kubernetes/ingress-nginx/my-ingress.yaml
```
