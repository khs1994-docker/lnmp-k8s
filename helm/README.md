# Helm LNMP

```bash
$ kubectl create namespace lnmp

# $ helm package . --tls

# $ helm install --dry-run --debug . --tls

$ helm install . --tls

# $ helm install --name lnmp lnmp-0.0.1.tgz --set service.type=NodePort --tls
```

## 删除

```bash
$ helm list --tls

$ helm delete NAME --tls
```

## 回退

```bash
$ helm rollback
```
