#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=marashisamin/prediction

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment --image=$dockerpath prediction


# Step 3:
# List kubernetes pods
kubectl get pods
podname=$(kubectl get pod -l app=prediction -o name)

# Step 4:
# Forward the container port to a host
kubectl port-forward $podname 8000:80 &
PID=$!
kubectl logs --tail 0 -f $podname
kill $PID
