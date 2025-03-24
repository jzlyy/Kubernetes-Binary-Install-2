#! /bin/bash

######Configure Kubernetes YUM Repository######

sudo cp /root/kubernetes-binary-install-2/configs/kubernetes.repo /etc/yum.repos.d/kubernetes.repo
sudo dnf makecache
