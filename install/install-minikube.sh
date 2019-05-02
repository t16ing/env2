#!/bin/bash

# Install minikube
# https://github.com/kubernetes/minikube

sudo apt install virtualbox -y
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
	sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Installation report
whereis minikube
minikube version
