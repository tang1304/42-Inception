FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install OpenSSL -y
RUN 