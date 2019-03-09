#!/bin/bash
cd /home/ubuntu/Hello-world-deployment/k8s_yml/ && pwd
TAG=$1
sed -i "s/hello_world_backend:.*/hello_world_backend:latest/g" backend_deployment.yml
kubectl replace -f backend_deployment.yml
sleep 30
sed -i "s/hello_world_backend:.*/hello_world_backend:${TAG}/g" backend_deployment.yml
kubectl replace -f backend_deployment.yml
echo "Done"