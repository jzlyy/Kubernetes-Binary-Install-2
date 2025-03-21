# kubernetes-binary-install-2
[![GitHub License](https://img.shields.io/github/license/zfc-6/kubernetes-binary-install-2)](https://github.com/zfc-6/kubernetes-binary-install-2)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)](CONTRIBUTING.md)

High Availability (HA) Cluster using kubeadm and keepalived (containerd container runtime)

>This project provides a one-click script for rapidly deploying a highly available Kubernetes cluster (supports versions 1.24+) in production environments, utilizing Containerd as the runtime and Calico as the CNI.

## 目录
- [功能特性](#功能特性)
- [环境要求](#环境要求)
- [快速开始](#快速开始)
- [详细配置](#详细配置)
- [架构说明](#架构说明)

---
## 功能特性
**核心功能**
- 一键部署高可用 Kubernetes 控制平面，支持多 Master 节点负载均衡
- 自动化签发 TLS 证书（etcd、apiserver、kubelet）
- 内置 Containerd 运行时优化配置
- 集成 Calico/Flannel等CNI 插件，支持 NetworkPolicy

**扩展能力**
- 可选部署 Ingress Controller（Nginx）
- 支持离线环境部署，提供Shell模式安装脚本
- 内置 Prometheus + Grafana 监控套件，实时采集集群指标
---

## 环境要求
### **硬件配置**
| 角色       | CPU  | 内存 | 磁盘  |
|------------|------|------|-------|
| Master     | 4核  | 6GB  | 60GB  | 
| Worker     | 4核  | 8GB  | 100GB |

### **版本匹配**
| Kubernetes 版本 |        测试通过的 CNI 版本          |  Containerd 版本 |
|-----------------|-------------------------------------|------------------|
| 1.32.3          | Calico 3.29.2  Flannel 0.26.5       | 1.7+             |
| 1.31.6          | Calico 3.29.1  Flannel 0.26.1       | 1.6+             |

### **软件依赖**
- 操作系统: CentOS 7.9+ / Rocky Linux 8.6+
- 容器运行时: Containerd 1.6+
- 内核版本: ≥ 5.4（推荐启用 `overlay2` 和 `ipvs` 模块）

### **网络要求**
- 控制平面节点开放端口: `6443` (apiserver), `2379-2380` (etcd)
- 节点间时间同步误差 < 1ms（需部署 NTP 服务）
---
## 快速开始
### 下载安装包（替换版本号）
    wget https://github.com/jzlyy/kubernetes-binary-install-2/archive/refs/tags/v1.32.3.tar.gz

### 解压并进入目录
    tar -xf v1.32.3.tar.gz
    cd kubernetes-binary-install-2-1.32.3/scripts

### 分布执行一键安装（默认使用 Calico CNI）
    sh ...
---
## 详细配置
### 自定义 kubeadm 模板
    修改 `configs/kubeadm-config.yaml` 中的核心参数：
    apiVersion: kubeadm.k8s.io/v1beta3
    kind: ClusterConfiguration
    kubernetesVersion: v1.32.3
    controlPlaneEndpoint: "172.168.20.90:16443"  # 高可用 VIP 地址
    networking:
      podSubnet: "192.168.0.0/16"         # 必须与 CNI 插件匹配
    apiServer:
      certSANs:                           # 证书扩展 SAN
        - "172.168.20.90"
        - "127.0.0.1"
        - "kubernetes.default.svc"
---
## 架构说明
### 高可用控制平面架构
    sequenceDiagram
    participant Client
    participant VIP
    participant Master1
    participant Master2
    participant etcd

    Client->>VIP: kubectl 命令 (6443)
    VIP-->>Master1: 负载均衡
    Master1->>etcd: 数据读写 (2379)
    Master1-->>Client: 返回结果
    Master2->>etcd: 数据同步

