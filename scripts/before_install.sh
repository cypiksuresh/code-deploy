#!/bin/bash
set -e

echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

echo "Removing old app..."
rm -rf /home/ubuntu/app
