# Helm

* https://github.com/helm/helm

* 安装 `socat`，yum apt 直装即可

## 客户端 TLS

* 证书直接用之前生成的，具体原理和 Dockerd TLS 一样

下载二进制文件，放入 PATH

把客户端证书放入指定文件夹，减少命令参数，这点和启用了 TLS 认证的原理一样

```bash
$ cp /etc/kubernetes/certs/ca.pem $(helm home)/ca.pem
$ cp /etc/kubernetes/certs/cert.pem $(helm home)/cert.pem
$ cp /etc/kubernetes/certs/key.pem $(helm home)/key.pem
```

## 服务端部署 TLS

* 由于网络问题，替换为国内源

```bash
$ helm init --tiller-tls --tiller-tls-cert /etc/kubernetes/certs/server-cert.pem \
      --tiller-tls-key /etc/kubernetes/certs/server-key.pem \
      --tiller-tls-verify --tls-ca-cert /etc/kubernetes/certs/ca.pem \
      --service-account=tiller \
      --upgrade -i \
      anjia0532/kubernetes-helm.tiller:v2.10.0 --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
```

客户端使用时加上 `--tls`
