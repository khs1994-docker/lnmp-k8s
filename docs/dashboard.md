# DashBoard

```bash
$ cd kubernetes

$ kubectl apply -f coreos-kubernetes/deployment/addons/dashboard.yaml

$ kubectl proxy
```

浏览器打开 http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
