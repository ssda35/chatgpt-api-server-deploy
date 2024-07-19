#!/bin/bash

set -e

# Di chuyển vào thư mục /app nơi tệp docker-compose.yml hiện diện
cd /app

# Chạy Docker Compose từ thư mục này
docker-compose pull
docker-compose up -d --remove-orphans
