#!/bin/bash

set -e

# Kiểm tra kết nối tới Docker daemon
docker info > /dev/null 2>&1

# Chạy Docker Compose
docker-compose pull
docker-compose up -d --remove-orphans
