#!/bin/bash

echo "PATH=$PATH"

# Make sure app directory exists and is owned properly
sudo mkdir -p /home/ubuntu/server
sudo chown -R ubuntu:ubuntu /home/ubuntu/server

# Write a deployment log
sudo mkdir -p /home/ubuntu/test-deploy
sudo chown ubuntu:ubuntu /home/ubuntu/test-deploy
echo "✅ Hello from CodeDeploy at $(date)" > /home/ubuntu/test-deploy/deploy_log.txt

# Go to the app directory
cd /home/ubuntu/server || {
  echo "❌ Directory /home/ubuntu/server is missing!"
  exit 1
}

# Install dependencies and start your NodeJS app with PM2
npm install || {
  echo "❌ npm install failed"
  exit 1
}

npm list -g pm2 &>/dev/null || sudo npm install -g pm2
pm2 delete Frontend || true
pm2 start server.js --name Frontend || {
  echo "❌ pm2 start failed"
  exit 1
}
