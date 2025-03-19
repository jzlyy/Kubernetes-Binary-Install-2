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
- [贡献指南](#贡献指南)
- [许可证](#许可证)

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
