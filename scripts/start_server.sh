#!/bin/bash

# Add PM2 to path (in case it's not there)
export PATH=$PATH:/usr/bin:/usr/local/bin

# Ensure directory exists before cd
cd /home/ubuntu/server || exit 1

# Restart app with PM2
pm2 delete Frontend || true
pm2 start server.js --name Frontend
