#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t prediction .

# Step 2: 
docker images

# Step 3: 
docker run --rm -p 8000:80 prediction
