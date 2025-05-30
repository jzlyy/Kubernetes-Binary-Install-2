#/bin/bash

######Install etcd######

#Download etcd toolkit
sudo wget https://github.com/etcd-io/etcd/releases/download/v3.5.21/etcd-v3.5.21-linux-amd64.tar.gz

sudo tar -xf etcd-v3.5.21-linux-amd64.tar.gz
sudo mv etcd-v3.5.21-linux-amd64/etcd* /usr/local/bin

#Configure etcd service file
sudo cp /root/kubernetes-binary-install/configs/etcd/etcd-03.service /etc/systemd/system/etcd-03.service

#Start etcd service
sudo systemctl daemon-reload
sudo systemctl enable etcd-03.service
sudo systemctl start etcd-03.service


