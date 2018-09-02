# Helm LNMP

## 部署 Helm

* https://github.com/khs1994-docker/lnmp-k8s/blob/master/docs/helm.md

## 配置文件

* https://docs.helm.sh/chart_template_guide/#accessing-files-inside-templates

由于配置文件只能在 `templates` 文件夹中，不能复用 `khs1994-docker/lnmp` 中的配置

## 部署 LNMP

### 注意事项

* [官方文档-模板配置](https://docs.helm.sh/chart_template_guide/#the-chart-template-developer-s-guide)

* 实际使用中每次业务升级变化最大的是 NGINX 和 PHP 部分，数据库，缓存可能不发生任何变化，建议根据实际自行修改。

### Debug

```bash
# Windows
$ helm install --dry-run --debug ./lnmp `
    --set APP_ENV=development `
    --set platform=windows `
    --set username=$env:username --tls

$ helm install --dry-run --debug ./lnmp \
    --set APP_ENV=development \
    --set platform=$(uname -s) \
    --set username=$(whoami) --tls
```

### 开发环境

```bash
# Windows
$ helm install ./lnmp `
    --name lnmp-development `
    --namespace lnmp-development `
    --set APP_ENV=development `
    --set platform=windows `
    --set username=$env:username `
    --tls

$ helm install ./lnmp \
    --name lnmp-development \
    --namespace lnmp-development \
    --set APP_ENV=development \
    --set platform=$(uname -s) \
    --set username=$(whoami) \
    --tls
```

### 测试环境

```bash
# Windows
$ helm install ./lnmp `
    --name lnmp-testing `
    --namespace lnmp-testing `
    --set APP_ENV=testing `
    --set platform=windows `
    --set username=$env:username `
    --tls

$ helm install ./lnmp \
    --name lnmp-testing \
    --namespace lnmp-testing \
    --set APP_ENV=testing \
    --set platform=$(uname -s) \
    --set username=$(whoami) \
    --tls
```

### 预上线环境

```bash
# Windows
$ helm install ./lnmp `
    --name lnmp-staging `
    --namespace lnmp-staging `
    --set APP_ENV=staging `
    --set platform=windows `
    --set username=$env:username `
    --tls

$ helm install ./lnmp \
    --name lnmp-staging \
    --namespace lnmp-staging \
    --set APP_ENV=staging \
    --set platform=$(uname -s) \
    --set username=$(whoami) \
    --tls
```

### 生产环境

```bash
# Windows
$ helm install ./lnmp `
    --name lnmp-production `
    --namespace lnmp-production `
    --set APP_ENV=production `
    --set platform=windows `
    --set username=$env:username `
    --tls

$ helm install ./lnmp \
    --name lnmp-production \
    --namespace lnmp-production \
    --set APP_ENV=production \
    --set platform=$(uname -s) \
    --set username=$(whoami) \
    --tls
```

## 删除

```bash
$ helm list --tls

$ helm delete NAME --purge --tls
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

## More Information

* https://www.kubernetes.org.cn/3435.html
