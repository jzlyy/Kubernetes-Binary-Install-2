#! /bin/bash

######Global operation######

sh /root/kubernetes-binary-install-2/scripts/cluster/worker/00-preflight.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/worker/01-network-rules.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/worker/02-time-chrony.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/worker/03-docker-install.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/worker/04-containerd-install.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/worker/05-kubernetes-yum.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/worker/06-kubenetes-tool-install.sh

