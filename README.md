# Kubernetes

## Prerequisites

To be able to run these examples, you will need to install minikube, kubectl, terraform and docker.

These example uses terraform to deploy resources on kubernetes. If you don't want to use terraform, you can also create .yaml config files for the resources.

## Install Prerequisites

Follow this guide the install minikube
https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Fx86-64%2Fstable%2Fbinary+download

if kubectl is not installed locally, minikube already includes kubectl which can be used like this:

```
minikube kubectl
```

Follow the commands to start minikube

1. Start minikube
    ```
    minikube start
    ```

2. Start minikube dashboard. All the resources like Pods, Services Deployments will be visible in the dashboard.
    ```
    minikube dashboard
    ```

# List of examples

- [Load Balancing Service](/Examples/LoadBalancingService/)
- [Rolling Updates] (TBD)
- [Auto Scaling Pods] (TBD)
- [StateFul Sets] (TBD)
- [ConfigMap and Secrets] (TBD)
