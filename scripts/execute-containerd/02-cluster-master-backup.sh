#! /bin/bash

######Global operation######

sh /root/kubernetes-binary-install/scripts/cluster/master-backup/01-network-rules.sh
sh /root/kubernetes-binary-install/scripts/cluster/master-backup/02-time-chrony.sh
sh /root/kubernetes-binary-install/scripts/cluster/master-backup/03-containerd/01-docker-install.sh
sh /root/kubernetes-binary-install/scripts/cluster/master-backup/03-containerd/02-containerd-install.sh
sh /root/kubernetes-binary-install/scripts/cluster/master-backup/04-keepalived+nginx.sh
sh /root/kubernetes-binary-install/scripts/cluster/master-backup/05-kubernetes-yum.sh
sh /root/kubernetes-binary-install/scripts/cluster/master-backup/06-kubenetes-tool-install.sh
