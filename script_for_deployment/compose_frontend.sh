#!/bin/bash
cd /home/ubuntu/Hello-world-deployment/dockerfile/frontend
docker build --no-cache -t kylinhuang/hello_world_frontend:latest .
cd /home/ubuntu/Hello-world-deployment/dockerfile/docker-compose
docker-compose down
docker-compose up -d
echo "Finish docker-compose"