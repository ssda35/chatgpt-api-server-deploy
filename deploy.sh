#!/bin/bash

set -e

# Kiểm tra xem Docker đã được cài đặt chưa
if ! command -v docker &> /dev/null
then
    echo "Docker không được tìm thấy. Đang cài đặt..."
    # Cài đặt Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
fi

# Kiểm tra xem Docker Compose đã được cài đặt chưa
if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose không được tìm thấy. Đang cài đặt..."
    # Cài đặt Docker Compose
    curl -fsSL https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# Chạy Docker Compose
docker-compose pull
docker-compose up -d --remove-orphans
