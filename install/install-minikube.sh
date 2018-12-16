#!/bin/bash

# Install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl/

sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Install kompose

curl -L https://github.com/kubernetes/kompose/releases/download/v1.16.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose

# Install minikube
# https://github.com/kubernetes/minikube

sudo apt install virtualbox -y
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
	sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Installation report
whereis minikube
minikube version
whereis kubectl
kubectl version
