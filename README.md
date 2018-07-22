# Run LNMP on Kubernetes

* [问题反馈](https://github.com/khs1994-docker/lnmp/issues/122)

* **Windows** 用户务必安装 `WSL`

## Kubernetes 基础设施

### 自己手动部署 Kubernetes 集群(CoreOS)

* https://github.com/khs1994-docker/coreos-kubernetes

### Docker Desktop

Please see https://github.com/khs1994-docker/lnmp-k8s/blob/dev/docs/docker-desktop.md

#### DashBoard

```bash
$ cd kubernetes

$ kubectl apply -f deployment/kubernetes-dashboard.yaml

$ kubectl proxy
```

浏览器打开 http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

### Minikube

* https://www.khs1994.com/docker/minikube/README.html

```bash
$ ./lnmp-k8s minikube-install

# move minikube to your PATH

$ ./lnmp-k8s minikube

# deploy

$ minikube service nginx --url

http://192.168.64.98:32228
http://192.168.64.98:30626

$ curl http://192.168.64.98:30626
```

#### 挂载宿主机目录

```bash
$ minikube mount ~/lnmp:/data/lnmp
```

#### 关闭 minikube

```bash
$ minikube stop
```

#### 移除 minikube

```bash
$ minikube delete
```

## 部署 lnmp

```bash
$ cd kubernetes

$ ./lnmp-k8s deploy
```

## 删除 lnmp

```bash
$ ./lnmp-k8s cleanup
```

## Windows 10

Please see https://github.com/khs1994-docker/lnmp-k8s/blob/dev/docs/windows.md

## More Information

* [feiskyer/kubernetes-handbook](https://github.com/feiskyer/kubernetes-handbook)
