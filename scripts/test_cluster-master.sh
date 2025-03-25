#! /bin/bash

######Global operation######

sh scripts/cluster/master/01-network-rules.sh
sh scripts/cluster/master/02-time-chrony.sh
sh scripts/cluster/master/03-docker-install.sh
sh scripts/cluster/master/04-containerd-install.sh
sh scripts/cluster/master/05-keepalived+nginx.sh
sh scripts/cluster/master/06-kubernetes-yum.sh
sh scripts/cluster/master/07-kubenetes-tool-install.sh
sh scripts/cluster/master/08-kubeadm-init.sh
sh scripts/cluster/master/networking-plugin/calico.sh

