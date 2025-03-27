#! /bin/bash

######Global operation######

sh cluster/master-backup/01-network-rules.sh
sh cluster/master-backup/02-time-chrony.sh
sh cluster/master-backup/03-docker-install.sh
sh cluster/master-backup/04-containerd-install.sh
sh cluster/master-backup/05-keepalived+nginx.sh
sh cluster/master-backup/06-kubernetes-yum.sh
sh cluster/master-backup/07-kubenetes-tool-install.sh
