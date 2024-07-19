FROM alpine:latest

# Cài đặt Docker CLI và các công cụ cần thiết
RUN apk add --no-cache docker-cli docker-compose bash

# Sao chép script deploy.sh vào container
COPY deploy.sh /usr/local/bin/deploy.sh
RUN chmod +x /usr/local/bin/deploy.sh

# Sao chép docker-compose.yml vào container
COPY docker-compose.yml /app/docker-compose.yml

# Sao chép thư mục config vào container
COPY config /app/config

# Sao chép thư mục docker-entrypoint-initdb.d vào container
COPY docker-entrypoint-initdb.d /app/docker-entrypoint-initdb.d

# Thiết lập WORKDIR
WORKDIR /app

# Chạy deploy.sh khi container khởi động
CMD ["/usr/local/bin/deploy.sh"]
