# Hello-world-deployment
## Introduction
This is a repo for all the deployment file used in build a simple devops process for hello-world project, including dockerfile, jenkinsfile, k8s yml configuration file and script for deployment.<br/>
To visit the website of hello world project, visit [http://34.245.28.220:31009/](http://34.245.28.220:31009/)

## Prerequisites
In order to run this devops solution in your server or local machine, you need to install [docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/), [docker-compose](https://docs.docker.com/compose/install/), a [kubernetes cluster](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/), as well as the set up of a [jenkins server](https://jenkins.io/).

## Continuous Integration and Continuous delivery
### Jenkins cluster
A jenkins master is setup by docker-compose using the [official jenkins image](https://hub.docker.com/r/jenkins/jenkins/) to schedule jenkins jobs. A node is add to jenkins cluster to execute pipeline jobs. Visit this jenkins service in [http://34.245.28.220:8080/](http://34.245.28.220:8080/), contact me for the info of the test user account.<br/>

Five jenkins pipeline are implemented for CI&CD purpose as well as health check of the deployed service:<br/>

1. Frontend pipeline: build frontend image and push to docker hub, send message to slack to report to success or failure of this job. A TAG_FRONTEND parameter is used to control the version of the image.
2. Deploy-frontend pipeline: rolling update  the frontend service in k8s cluster with a parameter to control the version, send message to slack to report to success or failure of this job.
3. Backend pipeline: build backend image and push to docker hub, send message to slack to report to success or failure of this job. A TAG_BACKEND parameter is used to control the version of the image.
4. Deploy-backend pipeline: rolling update  the backend service in k8s cluster with a parameter to control the version, send message to slack to report to success or failure of this job.
5. Health check pipeline: check the health of frontend and backend service every 10 minutes, send message to slack if failed to get response from frontend or backend service.

## Kubernetes cluster and deployment
A single master kubernetes cluster are bootstrapped using [kubeadm](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/) in AWS ecs instance.<br/>
Deployment, service and HorizontalPodAutoscaler are used to create a scalable, robust application.<br/>
1. Deployment: By default deployment will create 2 replicas and rolling update the application to offer seamless access.
2. Service: Frontend use LoadBalancer service to expose to external for public access and distribute traffic to frontend deployment; Backend use ClusterIP to expose to internal k8s cluster only for security purpose and distribute traffic to backend deployment.
3. HorizontalPodAutoscaler(hpa): hpa will scale up/down the deployment to make average cpu utilization less than 50%. The minReplicas and maxReplicas are 2 and 10 respectively.

## Continuous monitoring
A datadog agent is installed in k8s DaemonSet to monitor the metricsof the host server and docker containers. In datadog, we can set up alarm on system utilization to inform the devops engineer. To explore the datadog I set up for this project, contact me for the login info.

