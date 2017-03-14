FROM openresty/openresty:centos

MAINTAINER Daniel Secik <daniel.secik@mzk.cz>

ENV OPENSEADRAGON_DOWNLOAD_URL https://github.com/openseadragon/openseadragon/releases/download/v2.2.1/openseadragon-bin-2.2.1.tar.gz

RUN mkdir -p /var/www/imageserver/reader && \
    curl -L $OPENSEADRAGON_DOWNLOAD_URL | tar -xz -C /var/www/imageserver/reader --strip-components=1 && \
    useradd -s /bin/bash openresty

COPY index.html /var/www/imageserver/reader/reader.html
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY favicon.ico /var/www/imageserver/favicon.ico
COPY robots.txt /var/www/imageserver/robots.txt
    
EXPOSE 80 443

