## 常见故障场景
### kebe-proxy中的iptables模块
分析：1.在旧的Linux系统内核小于5.1.0，nf_conntrack_ipv4 和 nf_conntrack_ipv6是相互独立的并相互隔开的，因此，Linux系统内核小于5.0，用ipv4来进行转发数据包是可行的。

2.随时Linux内核的升级，到Linux大于5.1.0， nf_conntrack_ipv4 和 nf_conntrack_ipv6 被合并到 nf_conntrack 模块中，不再单独存在。

解决：新版内核直接引用nf_conntrack模块

### k8s版本与pause容器兼容性
分析：随着k8s版本更新，所需要的pause版本也在更替

解决：在containerd配置文件中修改相应的pauser版本参数

### 集群初始化超时或者无法集群初始化
分析：k8s版本没有匹配合适的docker-ce、docker-ce-cli版本

解决：结论：docker版本与k8s版本相差3个版本，k8s版本始终大于docker版本，指定安装docker引擎

### 工作节点加入失败之CRI适配器匹配失败
分析：k8s版本在1.24之后直接引用cri-containerd做容器运行时接口，废弃兼容的dockershim

解决：工作节点加入时需明确指定CRI，如：cri-containerd.sock、cri-dockerd.sock

### 网络插件无法正常初始化
分析：每个网络插件都有自己的单独的pod-cidr，如：Calico的pod-cidr是192.168.0.0/16，Flannel的pod-cidr是10.244.0.0/16

解决：在集群初始化时明确指定要匹配相应网络插件的pod-cidr

