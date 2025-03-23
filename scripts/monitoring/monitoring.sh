#!/bin/bash
set -x  # 启用调试输出

export HELM_CHART_PATH="/root/kubernetes-binary-install-2/artifacts/helm/kube-prometheus-stack"

# 创建命名空间（如果不存在）
kubectl create ns monitor

deploy_prometheus_stack() {
  helm upgrade --install kube-prom \
    --namespace monitoring \
    --values "${HELM_CHART_PATH}/values.yaml" \
    "${HELM_CHART_PATH}" \
    --debug  # 显示详细日志

  # 等待 Pod 就绪
  kubectl -n monitoring wait --for=condition=Ready pods --all --timeout=300s
}

# 执行函数
deploy_prometheus_stack
