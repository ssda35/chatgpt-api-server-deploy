#!/bin/bash

set -e

# Di chuyển vào thư mục /app nơi tệp docker-compose.yml hiện diện
cd /app
#!/bin/bash

set -e

# Di chuyển vào thư mục /app nơi tệp docker-compose.yml hiện diện
cd /app

# Kiểm tra kết nối tới Docker daemon
docker info > /dev/null 2>&1

# Chạy Docker Compose từ thư mục này
docker-compose pull
docker-compose up -d --remove-orphans
# Kiểm tra kết nối tới Docker daemon
docker info > /dev/null 2>&1

# Chạy Docker Compose từ thư mục này
docker-compose pull
docker-compose up -d --remove-orphans
