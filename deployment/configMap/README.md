# How create ConfigMap

```bash
$ kubectl create configmap my-config --from-literal=special.how=very

$ kubectl create configmap my-config --from-file=example.conf

$ kubectl create configmap my-config --from-env-file=.env.example
```

```bash
$ kubectl create configmap mysql-config --from-file=my.cnf

$ kubectl create configmap nginx-config --from-file=nginx.conf

$ kubectl create configmap nginx-t.khs1994.com --from-file=t.khs1994.com.conf
```
