# Helm LNMP

```bash
# $ helm package . --tls

# $ helm install --dry-run --debug . --tls

$ helm install --name lnmp lnmp-0.0.1.tgz --set service.type=NodePort --tls
```
