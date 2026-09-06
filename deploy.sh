#!/bin/bash

echo "🚀 Starting deployment..."

docker build -t devopslab:latest .

docker stop devops-web 2>/dev/null || true
docker rm devops-web 2>/dev/null || true

docker run -d \
  --name devops-web \
  -p 8080:80 \
  devopslab:latest

echo "✅ Deployment complete!"
