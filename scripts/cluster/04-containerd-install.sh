#! /bin/bash

######Install containerd environment######

#Download crictl interaction tool
#sudo wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.32.0/crictl-v1.32.0-linux-amd64.tar.gz
#sudo tar zxvf crictl-v1.32.0-linux-amd64.tar.gz -C /usr/local/bin

#Edit containerd configuration file
sudo containerd config default > /etc/containerd/config.toml
sudo sed -i 's#sandbox_image\s*=\s*"registry.k8s.io/pause:3.8"#sandbox_image="registry.aliyuncs.com/google_containers/pause:3.10"#g' /etc/containerd/config.toml
sudo sed -i 's#SystemdCgroup\s*=\s*false#SystemdCgroup = true#g' /etc/containerd/config.toml
sudo sed -i 's#config_path\s*=\s*""#config_path = "/etc/containerd/certs.d"#g' /etc/containerd/config.toml

#Start containerd service
sudo systemctl enable containerd
sudo systemctl start containerd

#Configure containerd image accelerator
sudo mkdir -p /etc/containerd/certs.d/docker.io
sudo cp /root/kubernetes-binary-install-2/configs/containerd/containerd.tolm /etc/containerd/certs.d/docker.io/hosts.toml

#Configure runtime and image pulling to use containerd
sudo cp /root/kubernetes-binary-install-2/configs/containerd/crictl.yaml /etc/crictl.yaml

#Restart containerd service
sudo systemctl daemon-reload
sudo systemctl restart containerd

#Set up Container Runtime Interface (CRI) for containerd
crictl config runtime-endpoint unix:///run/containerd/containerd.sock
