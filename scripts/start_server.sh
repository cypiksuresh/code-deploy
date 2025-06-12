#!/bin/bash

echo "PATH=$PATH"

# Make sure test-deploy directory exists and is owned by ubuntu
sudo mkdir -p /home/ubuntu/test-deploy
sudo chown ubuntu:ubuntu /home/ubuntu/test-deploy

# Write test log
echo "✅ Hello from CodeDeploy at $(date)" > /home/ubuntu/test-deploy/deploy_log.txt

# Go to app directory
cd /home/ubuntu/server || exit 1

# Install node dependencies
npm install

# Start app with PM2
pm2 delete Frontend || true
pm2 start server.js --name Frontend
