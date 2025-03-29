#! /bin/bash

######Install Docker environment######

#Enable Docker CE YUM repository
cd /etc/yum.repos.d || exit 1
sudo wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sudo dnf makecache

#Download Docker CE packages
sudo dnf -y install docker-ce
#Start Docker service
sudo systemctl enable docker
sudo systemctl start docker

#Configure Docker image accelerator
sudo mkdir -p /etc/docker
sudo cp /root/kubernetes-binary-install/configs/daemon.json /etc/docker/daemon.json

#Restart Docker service
sudo systemctl daemon-reload
sudo systemctl restart docker

