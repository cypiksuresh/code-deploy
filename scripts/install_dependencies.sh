#!/bin/bash

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 globally for all users
sudo npm install -g pm2

# Link PM2 for ubuntu user PATH
sudo ln -s /usr/bin/pm2 /usr/local/bin/pm2
