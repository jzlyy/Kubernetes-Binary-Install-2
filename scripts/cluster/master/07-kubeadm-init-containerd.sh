#! /bin/bash

######Initialize the Cluster with kubeadm######

sudo kubeadm init --config=/root/kubernetes-binary-install/configs/kubeadm-config-containerd.yaml --upload-certs

#Set Up kubectl Access
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
