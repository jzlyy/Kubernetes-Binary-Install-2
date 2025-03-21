#! /bin/bash

######Configure Chrony for time synchronization######

sudo cat /root/kubernetes-binary-install/configs/chrony.conf >> /etc/chrony.conf
sudo systemctl restart chrony.d

