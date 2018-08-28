# EFK 插件

## 注意事项

* 虚拟机每个节点内存分配 3G，之前分配了 2G 一直报错

## 部署

* https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/fluentd-elasticsearch

```bash
$ kubectl label nodes coreos3 beta.kubernetes.io/fluentd-ds-ready=true

$ cd deployment/addons/efk

$ kubectl create -f .

$ kubectl get pods -n kube-system -o wide|grep -E 'elasticsearch|fluentd|kibana'

$ kubectl cluster-info|grep -E 'Elasticsearch|Kibana'

$ kubectl proxy --address='192.168.57.1' --port=8086 --accept-hosts='^*$'
```

## 删除

```bash
$ kubectl delete deployment.apps/kibana-logging -n kube-system

$ kubectl delete service/kibana-logging -n kube-system

$ kubectl delete service/elasticsearch-logging -n kube-system

$ kubectl delete daemonset.apps/fluentd-es-v2.2.0 -n kube-system

$ kubectl delete statefulset.apps/elasticsearch-logging -n kube-system

$ kubectl delete statefulset.apps/elasticsearch-logging -n kube-system
```

## 资源列表

```bash
service/elasticsearch-logging

service/kibana-logging

daemonset.apps/fluentd
```

## 资源占用

`elasticsearch-logging-N` 单个 pod 内存占用 1.5 G，怪不得分配 2G 内存直接崩溃。
