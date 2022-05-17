#!/bin/bash

source ../.env
echo 'Starting kubernetes cluster'

minikube start --vm=true --driver=hyperkit

echo 'creating a deployment of the app.'

kubectl create deployment visual-testing-demo --image=$DOCKER_USERNAME/visual-testing-demo:latest
kubectl expose deployment visual-testing-demo --type=NodePort --port=3000
minikube service visual-testing-demo