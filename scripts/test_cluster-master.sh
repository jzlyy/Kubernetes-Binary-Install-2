#! /bin/bash

######Global operation######

set -euxo pipefail

# 动态获取脚本路径
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLUSTER_DIR="${SCRIPT_DIR}/cluster/master"

# 按顺序执行子脚本
"${CLUSTER_DIR}/00-network-rules.sh"
"${CLUSTER_DIR}/01-time-chrony.sh"
"${CLUSTER_DIR}/02-docker-install.sh"

# 执行网络插件脚本
"${CLUSTER_DIR}/networking-plugin/calico.sh"
