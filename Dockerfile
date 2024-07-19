# Sử dụng hình ảnh Docker chính thức hỗ trợ Docker-in-Docker
FROM docker:latest

# Cài đặt bash
RUN apk add --no-cache bash

# Sao chép script deploy.sh vào container
COPY deploy.sh /usr/local/bin/deploy.sh
RUN chmod +x /usr/local/bin/deploy.sh

# Sao chép docker-compose.yml vào container
COPY docker-compose.yml /app/docker-compose.yml

# Sao chép thư mục config vào container
COPY config /app/config

# Sao chép thư mục docker-entrypoint-initdb.d vào container
COPY docker-entrypoint-initdb.d /app/docker-entrypoint-initdb.d

# Chạy Docker daemon và deploy.sh khi container khởi động
CMD ["sh", "-c", "dockerd-entrypoint.sh & sleep 5 && /usr/local/bin/deploy.sh"]
