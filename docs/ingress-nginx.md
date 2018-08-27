# Docker for Desktop Kubernetes Ingress NGINX

* https://kubernetes.github.io/ingress-nginx/

## 部署

```bash
$ kubectl apply -f coreos-kubernetes/deployment/addons/ingress-nginx/ingress-nginx.yaml
```

### Docker 桌面版

```bash
$ kubectl apply -f coreos-kubernetes/deployment/addons/ingress-nginx/cloud-generic.yaml
```

### Linux

```bash
$ kubectl apply -f coreos-kubernetes/deployment/addons/ingress-nginx/service-nodeport.yaml
```

## 定义规则

```bash
$ kubectl apply -f coreos-kubernetes/ingress-nginx/my-ingress.yaml
```
