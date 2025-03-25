#! /bin/bash

######Global operation######

sh cluster/master/01-network-rules.sh
sh cluster/master/02-time-chrony.sh
sh cluster/master/03-docker-install.sh
sh cluster/master/04-containerd-install.sh
sh cluster/master/05-keepalived+nginx.sh
sh cluster/master/06-kubernetes-yum.sh
sh cluster/master/07-kubenetes-tool-install.sh
sh cluster/master/08-kubeadm-init.sh
sh cluster/master/networking-plugin/calico.sh

