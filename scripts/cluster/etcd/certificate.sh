#! /bin/bash

######Create certificates######

#Download certificate tools
sudo wget https://github.com/cloudflare/cfssl/releases/download/v1.6.4/cfssl_1.6.4_linux_amd64
sudo wget https://github.com/cloudflare/cfssl/releases/download/v1.6.4/cfssljson_1.6.4_linux_amd64
sudo wget https://github.com/cloudflare/cfssl/releases/download/v1.6.4/cfssl-certinfo_1.6.4_linux_amd64

#Generate executable variables
sudo chmod +x cfssl_1.6.4_linux_amd64 cfssl-certinfo_1.6.4_linux_amd64 cfssljson_1.6.4_linux_amd64
sudo mv cfssl_1.6.4_linux_amd64 /usr/local/bin/cfssl
sudo mv cfssljson_1.6.4_linux_amd64 /usr/local/bin/cfssljson
sudo mv cfssl-certinfo_1.6.4_linux_amd64 /usr/local/bin/cfssl-certinfo

#Create CA files and request files (execute on one host only)
sudo cp /root/kubernetes-binary-install/configs/etcd/ca-config.json ca-config.json
sudo cp /root/kubernetes-binary-install/configs/etcd/ca-csr.json ca-csr.json
cfssl gencert -initca ca-csr.json | cfssljson -bare ca

#Create server certificate request file
sudo cp /root/kubernetes-binary-install/configs/etcd/etcd-csr.json etcd-csr.json
cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -profile=etcd etcd-csr.json | cfssljson -bare etcd

#Create client certificate request file
sudo cp /root/kubernetes-binary-install/configs/etcd/client-csr.json client-csr.json
cfssl gencert \
   -ca=ca.pem \
   -ca-key=ca-key.pem \
   -config=ca-config.json \
   -profile=etcd client-csr.json | cfssljson -bare client

#Create peer certificate request file
sudo cp /root/kubernetes-binary-install/configs/etcd/peer-csr.json peer-csr.json
cfssl gencert \
   -ca=ca.pem \
   -ca-key=ca-key.pem \
   -config=ca-config.json \
   -profile=etcd peer-csr.json | cfssljson -bare peer

#Create directories and configure permissions
sudo mkdir -p /etc/etcd /var/lib/etcd
sudo chmod 700 /var/lib/etcd
sudo mv ca.pem etcd.pem etcd-key.pem peer.pem peer-key.pem client.pem client-key.pem /etc/etcd/

#Certificate storage directory
sudo mkdir ssl
sudo mv ca-config.json etcd-csr.json peer-csr.json client-csr.json ca-csr.json ca.csr ca-key.pem etcd.csr peer.csr client.csr ssl

#Ensure a unified trust chain (CA)
sudo scp /etc/etcd/{ca.pem,etcd.pem,etcd-key.pem,peer.pem,peer-key.pem} 172.168.20.121:/etc/etcd/
sudo scp /etc/etcd/{ca.pem,etcd.pem,etcd-key.pem,peer.pem,peer-key.pem} 172.168.20.122:/etc/etcd/
