#!/bin/bash
set -x  # Enable debug output

export HELM_CHART_PATH="/root/kubernetes-binary-install/artifacts/helm/kube-prometheus-stack"

# Create a namespace
kubectl create ns monitor

#Create a Grafana login account
kubectl create secret generic secret-grafana -n monitor \
  --from-literal=username=admin \
  --from-literal=password=grafana

deploy_prometheus_stack() {
  helm install kube-prometheus -n monitor  \
         ${HELM_CHART_PATH}
}

# Execute the function
deploy_prometheus_stack

