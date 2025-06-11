#!/bin/bash

echo "PATH=$PATH"

# Make sure directory exists and owned by ubuntu
sudo mkdir -p /home/ubuntu/test-deploy
sudo chown ubuntu:ubuntu /home/ubuntu/test-deploy

# Write test log
echo "✅ Hello from CodeDeploy at $(date)" > /home/ubuntu/test-deploy/deploy_log.txt
