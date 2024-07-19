# Sử dụng hình ảnh cơ bản từ Ubuntu
FROM ubuntu:latest

# Cài đặt các phụ thuộc cần thiết
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Sao chép script deploy.sh vào container
COPY deploy.sh /usr/local/bin/deploy.sh
RUN chmod +x /usr/local/bin/deploy.sh

# Sao chép các tập tin khác nếu cần
COPY . /app

# Chạy deploy.sh khi container khởi động
CMD ["/bin/bash", "/usr/local/bin/deploy.sh"]
