#! /bin/bash

######Global operation######

sh /root/kubernetes-binary-install-2/scripts/cluster/master/01-network-rules.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/master/02-time-chrony.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/master/03-docker-install.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/master/04-containerd-install.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/master/05-keepalived+nginx.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/master/06-kubernetes-yum.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/master/07-kubenetes-tool-install.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/master/08-kubeadm-init.sh
sh /root/kubernetes-binary-install-2/scripts/cluster/master/networking-plugin/09-calico-install.sh

