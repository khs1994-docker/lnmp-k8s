* https://raw.githubusercontent.com/projectcalico/calico/v3.25.1/manifests/calico.yaml
* https://projectcalico.docs.tigera.io/manifests/csi-driver.yaml

## 环境变量

* https://projectcalico.docs.tigera.io/reference/felix/configuration

## 目录说明

**calico** 适用于 kubeadm 创建的集群

**calico-custom** 适用于自定义了 CNI 插件目录等情况

## 参考

**dual-stack**

* https://projectcalico.docs.tigera.io/networking/ipv6

**环境变量**

* https://projectcalico.docs.tigera.io/reference/felix/configuration

## eBPF

* https://projectcalico.docs.tigera.io/maintenance/enabling-bpf
* https://www.tigera.io/blog/introducing-the-calico-ebpf-dataplane

**使用 eBPF 不再需要 kube-proxy 服务，请事先停止 kube-proxy**

```bash
$ sudo mount bpffs /sys/fs/bpf -t bpf
```

```bash
# 修改 calico-eBPF/kubernetes.yaml 并部署
$ kubectl apply -f addons/cni/calico-eBPF/kubernetes.yaml
$ kubectl apply -k addons/cni/calico-eBPF
```

**禁用 eBPF**

```bash
$ kubectl edit felixconfiguration -n kube-system

spec:
    bpfEnabled: false
```

**注意事项**

* eBPF 模式下，无法 ping 服务，但是可以正常访问（使用 curl 测试）
