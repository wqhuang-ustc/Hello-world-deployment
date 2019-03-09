#!/bin/bash
cd /home/ubuntu/Hello-world-deployment/k8s_yaml/ && pwd
TAG=$1
sed -i "s/hello_world_frontend:.*/hello_world_frontend:latest/g" frontend_deployment.yaml
kubectl replace -f frontend_deployment.yaml=
sleep 30
sed -i "s/hello_world_frontend:.*/hello_world_frontend:${TAG}/g" frontend_deployment.yaml
kubectl replace -f frontend_deployment.yaml
echo "Done"