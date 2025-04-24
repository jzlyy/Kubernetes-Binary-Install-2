#! /bin/bash

######Install Calico Networking Plugin######

sudo kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.29.3/manifests/tigera-operator.yaml
sudo kubectl apply -f /root/kubernetes-binary-install/manifests/calico/resources.yaml

