#!/bin/bash

echo "PATH=$PATH"

mkdir -p /home/ubuntu/test-deploy

echo "✅ Hello from CodeDeploy at $(date)" > /home/ubuntu/test-deploy/deploy_log.txt
