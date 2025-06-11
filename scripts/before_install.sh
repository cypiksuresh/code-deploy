#!/bin/bash
set -e

echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

echo "Removing old app..."
sudo rm -rf /home/ubuntu/app/*
