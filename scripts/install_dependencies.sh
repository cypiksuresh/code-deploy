#!/bin/bash
set -e

echo "Starting Node.js server..."
cd /home/ubuntu/app
npm start &
