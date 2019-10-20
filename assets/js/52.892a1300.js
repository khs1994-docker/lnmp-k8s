(window.webpackJsonp=window.webpackJsonp||[]).push([[52],{218:function(e,t,r){"use strict";r.r(t);var o=r(0),s=Object(o.a)({},function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"content"},[e._m(0),e._v(" "),e._m(1),e._v(" "),e._m(2),e._v(" "),r("p",[r("code",[e._v("Pod")]),e._v(" 通过 "),r("code",[e._v("flexvolume")]),e._v(" "),r("code",[e._v("in-tree")]),e._v(" 插件与 "),r("code",[e._v("Flexvolume")]),e._v(" 驱动程序交互。 更多详情请参考 "),r("a",{attrs:{href:"https://github.com/kubernetes/community/blob/master/contributors/devel/sig-storage/flexvolume.md",target:"_blank",rel:"noopener noreferrer"}},[e._v("这里"),r("OutboundLink")],1),e._v("。")]),e._v(" "),r("h2",{attrs:{id:"out-of-tree-卷插件"}},[r("a",{staticClass:"header-anchor",attrs:{href:"#out-of-tree-卷插件","aria-hidden":"true"}},[e._v("#")]),e._v(" "),r("a",{attrs:{href:"https://kubernetes.io/zh/docs/concepts/storage/volumes/#out-of-tree-%E5%8D%B7%E6%8F%92%E4%BB%B6",target:"_blank",rel:"noopener noreferrer"}},[e._v("Out-of-Tree 卷插件"),r("OutboundLink")],1)]),e._v(" "),e._m(3),e._v(" "),e._m(4),e._v(" "),r("p",[e._v("CSI 和 FlexVolume 都允许独立于 Kubernetes 代码库开发卷插件，并作为扩展部署（安装）在 Kubernetes 集群上。")]),e._v(" "),r("p",[e._v("对于希望创建 out-of-tree 卷插件的存储供应商，请参考这个 "),r("a",{attrs:{href:"https://github.com/kubernetes/community/blob/master/sig-storage/volume-plugin-faq.md",target:"_blank",rel:"noopener noreferrer"}},[e._v("FAQ"),r("OutboundLink")],1),e._v("。")])])},[function(){var e=this.$createElement,t=this._self._c||e;return t("h1",{attrs:{id:"flexvolume"}},[t("a",{staticClass:"header-anchor",attrs:{href:"#flexvolume","aria-hidden":"true"}},[this._v("#")]),this._v(" FlexVolume")])},function(){var e=this.$createElement,t=this._self._c||e;return t("ul",[t("li",[this._v("https://segmentfault.com/a/1190000020320771")]),this._v(" "),t("li",[this._v("https://blog.csdn.net/liuliuzi_hz/article/details/74942002")])])},function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("p",[r("code",[e._v("FlexVolume")]),e._v(" 是一个自 1.2 版本（在 "),r("code",[e._v("CSI")]),e._v(" 之前）以来在 "),r("code",[e._v("Kubernetes")]),e._v(" 中一直存在的 "),r("code",[e._v("out-of-tree")]),e._v(" 插件接口。 它使用基于 "),r("code",[e._v("exec")]),e._v(" 的模型来与驱动程序对接。 用户必须在每个节点（在某些情况下是主节点）上的预定义卷插件路径中安装 "),r("code",[e._v("FlexVolume")]),e._v(" 驱动程序可执行文件。")])},function(){var e=this.$createElement,t=this._self._c||e;return t("p",[t("code",[this._v("Out-of-Tree")]),this._v(" 卷插件包括容器存储接口（CSI）和 "),t("code",[this._v("FlexVolume")]),this._v("。 它们使存储供应商能够创建自定义存储插件，而无需将它们添加到 Kubernetes 代码仓库。")])},function(){var e=this.$createElement,t=this._self._c||e;return t("p",[this._v("在引入 "),t("code",[this._v("CSI")]),this._v(" 和 "),t("code",[this._v("FlexVolume")]),this._v(" 之前，所有卷插件（如上面列出的卷类型）都是 “in-tree” 的，这意味着它们是与 Kubernetes 的核心组件一同构建、链接、编译和交付的，并且这些插件都扩展了 Kubernetes 的核心 API。这意味着向 Kubernetes 添加新的存储系统（卷插件）需要将代码合并到 Kubernetes 核心代码库中。")])}],!1,null,null,null);t.default=s.exports}}]);