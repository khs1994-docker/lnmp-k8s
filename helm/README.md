# Helm LNMP

## 配置文件

* https://docs.helm.sh/chart_template_guide/#accessing-files-inside-templates

由于配置文件只能在 `templates` 文件夹中，不能复用 `khs1994-docker/lnmp` 中的配置

## 部署

* https://docs.helm.sh/chart_template_guide/#the-chart-template-developer-s-guide

```bash
$ kubectl create namespace lnmp

# Debug
# $ helm install --dry-run --debug ./lnmp --tls

$ helm install ./lnmp --name lnmp --tls
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

## 打包

```bash
$ helm package ./lnmp

$ helm install --name lnmp lnmp-0.0.1.tgz --set service.type=NodePort --tls
```
