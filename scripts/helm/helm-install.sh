#! /bin/bash

######Install Helm######

# Download helm tool
wget https://get.helm.sh/helm-v3.17.2-linux-amd64.tar.gz
tar -xf helm-v3.17.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin 
