#! /bin/bash

######创建证书######

#下载证书工具
sudo wget https://github.com/cloudflare/cfssl/releases/download/v1.6.4/cfssl_1.6.4_linux_amd64
sudo wget https://github.com/cloudflare/cfssl/releases/download/v1.6.4/cfssljson_1.6.4_linux_amd64
sudo wget https://github.com/cloudflare/cfssl/releases/download/v1.6.4/cfssl-certinfo_1.6.4_linux_amd64

#生成可执行变量
sudo chmod +x cfssl_1.6.4_linux_amd64 cfssl-certinfo_1.6.4_linux_amd64 cfssljson_1.6.4_linux_amd64
sudo mv cfssl_1.6.4_linux_amd64 /usr/local/bin/cfssl
sudo mv cfssljson_1.6.4_linux_amd64 /usr/local/bin/cfssljson
sudo mv cfssl-certinfo_1.6.4_linux_amd64 /usr/local/bin/cfssl-certinfo

#创建CA证书
sudo cp /root/kubernetes-binary-install-2/configs/etcd/ca-config.json ca-config.json
sudo cp /root/kubernetes-binary-install-2/configs/etcd/ca-csr.json ca-csr.json
sudo cp /root/kubernetes-binary-install-2/configs/etcd/etcd-csr.json etcd-csr.json

#生成证书
cfssl gencert -initca ca-csr.json | cfssljson -bare ca

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -profile=etcd etcd-csr.json | cfssljson -bare etcd

#确保统一的信任链(CA)
sudo scp /etc/etcd/{ca.pem,etcd.pem,etcd-key.pem} 172.168.20.121:/etc/etcd/
sudo scp /etc/etcd/{ca.pem,etcd.pem,etcd-key.pem} 172.168.20.122:/etc/etcd/
