#!/bin/bash
cd /home/ubuntu/Hello-world-deployment/k8s_yaml/ && pwd
TAG=$1
sed -i "s/hello_world_backend:.*/hello_world_backend:latest/g" backend_deployment.yaml
kubectl replace -f backend_deployment.yaml
sleep 30
sed -i "s/hello_world_backend:.*/hello_world_backend:${TAG}/g" backend_deployment.yaml
kubectl replace -f backend_deployment.yaml
echo "Done"