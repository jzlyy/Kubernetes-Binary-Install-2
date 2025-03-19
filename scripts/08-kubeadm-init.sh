#! /bin/bash

######Initialize the Cluster with kubeadm######

sudo kubeadm init \
--apiserver-advertise-address=172.168.20.10 \
--control-plane-endpoint=172.168.20.10:16443 --upload-certs \
--kubernetes-version=v1.32.3 \
--image-repository registry.aliyuncs.com/google_containers \
--cri-socket unix:///run/containerd/containerd.sock \
--pod-network-cidr=10.244.0.0/16 \
--service-cidr=10.96.0.0/12

#Set Up kubectl Access
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
