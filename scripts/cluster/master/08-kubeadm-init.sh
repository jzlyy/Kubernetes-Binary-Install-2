#! /bin/bash

######Initialize the Cluster with kubeadm######

sudo kubeadm init --config=/root/kubernetes-binary-install-2/configs/kubeadm-config.yaml --upload-certs

#Set Up kubectl Access
sudo mkdir -p ~/.kube
sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config
sudo -E chown $(id -u):$(id -g) "$HOME/.kube/config"
