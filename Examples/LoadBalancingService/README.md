## Overview

This contains an example of a sample node js application deployed on kubernetes cluster with load balancing between multiple replicas

### Resources:
- Deployment (`test-deployment`) with `x` replicas for node js application. Deployment also takes care of redeploying the containers incase they are terminated.
- Service(`test-service`) to expose the application to be accessed from outside of k8 cluster. This service also provides load balancing between available replicas.

## How to run the example

Make sure you have followed [these](/README.md) step before moving forward.

1. Configure minikube docker environment variables. (This should be run every time a new terminal is opened).
    ```
    eval $(minikube docker-env)
    ```

2. Build the docker image for test node js app
    ```
    cd test
    docker build -t test-node .
    ```

3. Go to Kubernetes-demo folder and run the following 
    ```
    cd kubernetes-demo
    terraform init
    terraform plan
    terraform apply
    ```

Once above command is successful, the kubernetes resources are created. You can verify the resources using 
```
[minikube] kubectl get pods
[minikube] kubectl get services
```
**NOTE**: If kubectl is not install locally, append minikube before the command.


4. Use the minikube service to tunnel and test the service from host machine when using docker 
    ```
    minikube service test-node-service --url
    ```


## Verifying the Load Balancing

Using the following command to watch the logs and fire few request to the service url. A `/test-route` is exposed in the test node js app for this purpose. The route will logs the ip of the container which is being used to serve the request.

```
minikube logs -f -l app=testpod
```
