# Run an image
kubectl run my-nginx --image nginx

# Run a temporary shell in cluster
kubectl run --generator run-pod/v1 tmp-shell --rm -it --image bretfisher/netshoot -- bash

# Run and expose in the same command
kubectl run test --image nginx --port 80 --expose

# Run a cron job in Kubernetes
kubectl run test --image nginx --schedule "*/1 * * * *"

# Get running pods
kubectl get pods
kubectl get pods -w

#Get all objects
kubectl get all

# Remove a deployment
kubectl delete deployment my-nginx

# Scaling pods
kubectl run my-apache --image httpd
kubectl scale deploy/my-apache --replicas 2
kubectl scale deployment my-apache --replicas 2

# Inspecting deployment objects
## Get container logs
kubectl logs deployment/my-apache
kubectl logs deployment/my-apache --follow --tail 5

# Inspect a POD
kubectl describe pod/my-apache-xxxx-yyyy

# Delete a pod
kubectl delete pod/my-apache-xxxx-yyyy

# Delete services, deployments in 1 line
kubectl delete service/httpenv  service/httpenv-lb service/httpenv-np deployment/httpenv

# Expose deployment ports
## Expose via cluster IP (the default)
kubectl expose deployment/httpenv --port 8888

## Expose using NodePort system
kubectl expose deployment/httpenv --port 8888 --name httpenv-np --type NodePort
### On Minikube, to check the exposed ip:
minikube service httpenv-np --url

## Expose using LoadBalancer system
kubectl expose deployment/httpenv --port 8888 --name httpenv-lb --type LoadBalancer

# Get exposed services
kubectl get service

# Generators
# --dry-run flag is used to preview the object that would be sent to the cluster, without really submitting it
# -o flag is to output the specification yo a YAML file
## Generate a deployment spec file
kubectl create deployment test --image nginx --dry-run -o yaml
## Generate a job spec file (a job is process that it's removed when it's done)
kubectl create job test --image nginx --dry-run -o yaml
## Expose an existing deployment
kubectl expose deployment/test --port 80 --dry-run -o yaml

# List all possible Kubernetes resources in our server
kubectl api-resources

# List all API versionos in our server
kubectl api-versions

# List all keys supported in YAML files for an specific object
kubectl explain pods --recursive
kubectl explain services --recursive
kubectl explain deployments --recursive
## List with descriptions
kubectl explain services.spec
kubectl explain services.spec.type

# Minikube DNS issue (Win)
set NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24
minikube start --kubernetes-version='1.17.4'

