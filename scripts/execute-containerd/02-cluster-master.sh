#! /bin/bash

######Global operation######

sh /root/kubernetes-binary-install/scripts/cluster/master/01-network-rules.sh
sh /root/kubernetes-binary-install/scripts/cluster/master/02-time-chrony.sh
sh /root/kubernetes-binary-install/scripts/cluster/master/03-containerd/01-docker-install.sh
sh /root/kubernetes-binary-install/scripts/cluster/master/03-containerd/02-containerd-install.sh
sh /root/kubernetes-binary-install/scripts/cluster/master/04-keepalived+nginx.sh
sh /root/kubernetes-binary-install/scripts/cluster/master/05-kubernetes-yum.sh
sh /root/kubernetes-binary-install/scripts/cluster/master/06-kubenetes-tool-install.sh
sh /root/kubernetes-binary-install/scripts/cluster/master/07-kubeadm-init-containerd.sh
sh /root/kubernetes-binary-install/scripts/cluster/master/networking-plugin/calico.sh
