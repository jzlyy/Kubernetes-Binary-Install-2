#/bin/bash

######安装etcd######

#下载etcd工具包
sudo wget https://github.com/etcd-io/etcd/releases/download/v3.5.21/etcd-v3.5.21-linux-amd64.tar.gz

sudo tar -xf etcd-v3.5.21-linux-amd64.tar.gz
sudo mv etcd-v3.5.21-linux-amd64/etcd* /usr/local/bin

#创建目录和权限配置
sudo mkdir -p /etc/etcd /var/lib/etcd
sudo chmod 700 /var/lib/etcd
sudo mv ca.pem etcd.pem etcd-key.pem /etc/etcd/

#配置etcd服务文件
sudo cp /root/kubernetes-binary-install-2/configs/etcd/etcd-02.service /etc/systemd/system/etcd-02.service

#启动etcd
sudo systemctl daemon-reload
sudo systemctl enable etcd-02.service
sudo systemctl start etcd-02.service


