#! /bin/bash

######Set up Layer 4 load balancing with keepalived and Nginx######

#Download Nginx and keepalived packages
sudo dnf -y install epel-release 
sudo dnf -y install nginx keepalived 
sudo dnf -y install nginx-all-modules.noarch

#Modify Nginx configuration file
sudo cat /root/kubernetes-binary-install/configs/loadbalancer/nginx.conf | sudo tee -a /etc/nginx/nginx.conf >/dev/null

#Modify keepalived configuration file (Backup)
sudo cp /root/kubernetes-binary-install/configs/loadbalancer/backup-keepalived.conf /etc/keepalived/keepalived.conf

#Configure Nginx health checks
sudo cp /root/kubernetes-binary-install/configs/loadbalancer/check_nginx.sh /etc/keepalived/check_nginx.sh
chmod +x /etc/keepalived/check_nginx.sh

#Start Nginx and keepalived services
sudo systemctl daemon-reload
sudo systemctl enable nginx keepalived
sudo systemctl start nginx keepalived

#Verify VIP failover
sudo ip a

