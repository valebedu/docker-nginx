# Docker on Nginx
#
# version 0.2.2

FROM ubuntu:xenial

LABEL name="docker-nginx" \
    description="docker-nginx help you to build applications running with nginx on ubuntu systems." \
    version="0.2.2" \
    maintainer="Valentin Bercot <valent1.bercot@gmail.com>"

# Set Nginx platform
ARG NGINX_PLATFORM=xenial

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Download and add the Nginx key to the apt program keyring
RUN wget http://nginx.org/keys/nginx_signing.key && \
    apt-key add nginx_signing.key && \
# Config sources.list
    echo "deb http://nginx.org/packages/ubuntu/ $NGINX_PLATFORM nginx" >> /etc/apt/sources.list && \
    echo "deb-src http://nginx.org/packages/ubuntu/ $NGINX_PLATFORM nginx" >> /etc/apt/sources.list && \
# Install Nginx
    apt-get update && \
    apt-get install -y \
    nginx && \
    rm -rf /var/lib/apt/lists/*

# Expose ports
EXPOSE 80 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
