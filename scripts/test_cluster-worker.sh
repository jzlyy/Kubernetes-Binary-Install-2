#! /bin/bash

######Global operation######

sh cluster/worker/01-network-rules.sh
sh cluster/worker/02-time-chrony.sh
sh cluster/worker/03-docker-install.sh
sh cluster/worker/04-containerd-install.sh
sh cluster/worker/05-kubernetes-yum.sh
sh cluster/worker/06-kubenetes-tool-install.sh

