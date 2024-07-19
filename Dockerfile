# Sử dụng hình ảnh cơ bản từ Ubuntu
FROM ubuntu:latest

# Cài đặt các phụ thuộc cần thiết và Docker
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Sao chép script deploy.sh vào container
COPY deploy.sh /usr/local/bin/deploy.sh
RUN chmod +x /usr/local/bin/deploy.sh

# Sao chép thư mục config vào container
COPY config /app/config

# Sao chép các tập tin khác nếu cần
COPY . /app

# Chạy deploy.sh khi container khởi động
CMD ["/bin/bash", "/usr/local/bin/deploy.sh"]
