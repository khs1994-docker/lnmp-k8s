# How create ConfigMap

```bash
$ kubectl create configmap my-config --from-literal=special.how=very

$ kubectl create configmap my-config --from-file=example.conf

# k=v file
$ kubectl create configmap my-config --from-env-file=.env.example
```

```bash
$ kubectl create configmap lnmp-mysql-cnf --from-file=my.cnf

$ kubectl create configmap lnmp-nginx-conf --from-file=nginx.conf

$ kubectl create configmap lnmp-nginx-conf-d --from-file=t.khs1994.com.conf
```
