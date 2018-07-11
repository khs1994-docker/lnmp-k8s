# Docs

## Service

Service 通过 `Label Selector` 来匹配一系列的 Pod，Label Selector 允许在 Label 上做一系列的逻辑操作。

![](https://kubernetes.io/docs/tutorials/kubernetes-basics/public/images/module_04_labels.svg)

## 服务暴露方式

* https://blog.csdn.net/newcrane/article/details/79092577

* https://blog.csdn.net/limx59/article/details/71717275

```bash

internet
    |
------------
[ Services ]

```

### Nodeport

把 service 的 port 映射到每个节点内部指定 port 上，所有节点内部映射的 port 都一样。

### Loadbalancer

### Ingress

```bash

internet
    |
[ Ingress ]
--|-----|--
[ Services ]

```

### Traefik

* https://github.com/containous/traefik

![](https://raw.githubusercontent.com/containous/traefik/master/docs/img/architecture.png)

# More Information

* https://github.com/kubernetes/examples
