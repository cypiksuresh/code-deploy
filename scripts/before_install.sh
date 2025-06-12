#!/bin/bash

echo "🔧 Running BeforeInstall script..."

# Ensure ownership of the target directory
if [ -d "/home/ubuntu/server" ]; then
    echo "➡ Fixing permissions for /home/ubuntu/server"
    sudo chown -R ubuntu:ubuntu /home/ubuntu/server
    sudo chmod -R 755 /home/ubuntu/server
fi

# Stop any running PM2 app
if command -v pm2 &> /dev/null; then
    echo "🛑 Stopping and deleting existing PM2 process"
    pm2 stop Frontend || true
    pm2 delete Frontend || true
    pm2 flush || true
fi

# Remove the old app directory
if [ -d "/home/ubuntu/server" ]; then
    echo "🗑 Removing old server directory"
    rm -rf /home/ubuntu/server
    echo "✅ Old server directory removed"
fi

echo "✅ BeforeInstall completed"
