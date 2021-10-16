#!/bin/bash
echo "Removing Old Service ..."
docker stop backend && docker rm backend

echo "Building New Image ..."
docker build -f Dockerfile.dev -t backend:dev .

echo "Starting Container"
docker run -d -p 8081:8081 --name backend backend:dev

echo "Setup Timezone"
docker run -e TZ=Asia/Jakarta debian:jessie date
