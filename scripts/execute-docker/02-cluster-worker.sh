#! /bin/bash

######Global operation######

sh /root/kubernetes-binary-install/scripts/cluster/worker/01-network-rules.sh
sh /root/kubernetes-binary-install/scripts/cluster/worker/02-time-chrony.sh
sh /root/kubernetes-binary-install/scripts/cluster/worker/03-docker/docker-install.sh
sh /root/kubernetes-binary-install/scripts/cluster/worker/04-kubernetes-yum.sh
sh /root/kubernetes-binary-install/scripts/cluster/worker/05-kubenetes-tool-install.sh

