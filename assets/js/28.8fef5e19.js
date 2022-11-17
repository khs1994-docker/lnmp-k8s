(window.webpackJsonp=window.webpackJsonp||[]).push([[28],{382:function(t,a,s){"use strict";s.r(a);var n=s(42),e=Object(n.a)({},(function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("ContentSlotsDistributor",{attrs:{"slot-key":t.$parent.slotKey}},[s("h1",{attrs:{id:"rbac"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#rbac"}},[t._v("#")]),t._v(" RBAC")]),t._v(" "),s("h2",{attrs:{id:"新建用户"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#新建用户"}},[t._v("#")]),t._v(" 新建用户")]),t._v(" "),s("div",{staticClass:"language-bash extra-class"},[s("pre",{pre:!0,attrs:{class:"language-bash"}},[s("code",[s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("# 用户")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token assign-left variable"}},[t._v("CN_NAME")]),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v("'username'")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("# 用户组")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token assign-left variable"}},[t._v("O")]),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v("'scope:groupname'")]),t._v("\n\n"),s("span",{pre:!0,attrs:{class:"token builtin class-name"}},[t._v("echo")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token string"}},[t._v('\'{\n    "CN":"\'')]),s("span",{pre:!0,attrs:{class:"token variable"}},[t._v("$CN_NAME")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v('\'",\n    "hosts":[""],\n    "key":{\n      "algo":"ecdsa",\n      "size": 384\n    },\n    "names":[{\n      "C":"CN",\n      "ST":"Beijing",\n      "L":"Beijing",\n      "O":"\'')]),s("span",{pre:!0,attrs:{class:"token variable"}},[t._v("$O")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v('\'",\n      "OU":"khs1994.com"\n    }]\n    }\'')]),t._v(" "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n       "),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("|")]),t._v(" cfssl gencert -config"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("ca-config.json -ca"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("ca.pem -ca-key"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("ca-key.pem  "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n       -profile"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("kubernetes - "),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("|")]),t._v(" cfssljson -bare "),s("span",{pre:!0,attrs:{class:"token variable"}},[t._v("$CN_NAME")]),t._v("\n\n$ kubectl config set-cluster myCluster "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --certificate-authority"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("ca.pem "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --embed-certs"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("true "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --server"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),s("span",{pre:!0,attrs:{class:"token variable"}},[t._v("${KUBE_APISERVER}")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --kubeconfig"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("kubectl.kubeconfig\n\n$ kubectl config set-credentials "),s("span",{pre:!0,attrs:{class:"token variable"}},[t._v("$CN_NAME")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --client-certificate"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),s("span",{pre:!0,attrs:{class:"token variable"}},[t._v("$CN_NAME")]),t._v(".pem "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --client-key"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),s("span",{pre:!0,attrs:{class:"token variable"}},[t._v("$CN_NAME")]),t._v("-key.pem "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --embed-certs"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("true "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --kubeconfig"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("kubectl.kubeconfig\n\n$ kubectl config set-context myContext "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --cluster"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("myCluster "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --user"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),s("span",{pre:!0,attrs:{class:"token variable"}},[t._v("$CN_NAME")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("\\")]),t._v("\n  --kubeconfig"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("kubectl.kubeconfig\n\n$ kubectl config use-context myContext --kubeconfig"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("kubectl.kubeconfig\n")])])]),s("p",[t._v("下面设置 "),s("code",[t._v("scope:groupname")]),t._v(" 组的用户只能列出和获取到 "),s("code",[t._v("default")]),t._v(" 命名空间的 "),s("code",[t._v("pod")]),t._v("，其他资源无法获取。")]),t._v(" "),s("div",{staticClass:"language-yaml extra-class"},[s("pre",{pre:!0,attrs:{class:"language-yaml"}},[s("code",[s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("# 角色拥有的权限")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("kind")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" Role\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("apiVersion")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" rbac.authorization.k8s.io/v1\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("metadata")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("\n  "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("name")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" default"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("pod_get\n  "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("namespace")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" default\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("rules")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("\n  "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("-")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("apiGroups")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("[")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v('""')]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("]")]),t._v("\n    "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("verbs")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("[")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v('"get"')]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(",")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v('"list"')]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("]")]),t._v("\n    "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("resources")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("[")]),s("span",{pre:!0,attrs:{class:"token string"}},[t._v('"pods"')]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("]")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("---")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token comment"}},[t._v("# 将用户组与角色绑定")]),t._v("\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("kind")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" RoleBinding\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("apiVersion")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" rbac.authorization.k8s.io/v1\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("metadata")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("\n  "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("name")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" default"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("pod_get\n  "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("namespace")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" default\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("subjects")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("\n  "),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v("-")]),t._v(" "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("kind")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" Group\n    "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("name")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" scope"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("groupname\n    "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("apiGroup")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" rbac.authorization.k8s.io\n"),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("roleRef")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("\n  "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("kind")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" Role\n  "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("name")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" default"),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v("pod_get\n  "),s("span",{pre:!0,attrs:{class:"token key atrule"}},[t._v("apiGroup")]),s("span",{pre:!0,attrs:{class:"token punctuation"}},[t._v(":")]),t._v(" rbac.authorization.k8s.io\n")])])])])}),[],!1,null,null,null);a.default=e.exports}}]);