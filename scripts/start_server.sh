#!/bin/bash

echo "PATH = $PATH"

# Add PM2 to path explicitly
export PATH=$PATH:/usr/bin:/usr/local/bin

cd /home/ubuntu/server || {
  echo "❌ Directory /home/ubuntu/server does not exist!"
  exit 1
}

# Restart app using PM2
echo "Restarting app with PM2..."
pm2 delete Frontend || true
pm2 start server.js --name Frontend
