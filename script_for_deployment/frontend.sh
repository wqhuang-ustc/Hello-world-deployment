#!/bin/bash
cd /home/ubuntu/Hello-world-deployment/k8s_yml/ && pwd
TAG=$1
sed -i "s/hello_world_frontend:.*/hello_world_frontend:latest/g" frontend_deployment.yml
kubectl replace -f frontend_deployment.yml
sleep 30
sed -i "s/hello_world_frontend:.*/hello_world_frontend:${TAG}/g" frontend_deployment.yml
kubectl replace -f frontend_deployment.yml 
echo "Done"