#!/bin/bash

echo "PATH=$PATH"

# Make sure directory exists and owned by ubuntu
sudo mkdir -p /home/ubuntu/test-deploy
sudo chown ubuntu:ubuntu /home/ubuntu/test-deploy

# Write test log
echo "✅ Hello from CodeDeploy at $(date)" > /home/ubuntu/test-deploy/deploy_log.txt

# Go to app directory
cd /home/ubuntu/test-deploy || exit 1

# Start server in background (log output)
nohup node server.js > server.log 2>&1 &
