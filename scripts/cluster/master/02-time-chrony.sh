#! /bin/bash

######Configure Chrony for time synchronization######

sudo cat /root/Kubernetes-Binary-Install-2/configs/chrony.conf >> /etc/chrony.conf
sudo systemctl restart chronyd
