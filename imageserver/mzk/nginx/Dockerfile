FROM nginx:latest

RUN apt-get update && apt-get install -y wget nano && rm -rf /var/lib/apt/lists/*
ADD index.html /var/www/imageserver/reader/reader.html
RUN wget --no-verbose https://github.com/openseadragon/openseadragon/releases/download/v2.1.0/openseadragon-bin-2.1.0.tar.gz \
&& tar -xf openseadragon-bin-2.1.0.tar.gz \
&& rm openseadragon-bin-2.1.0.tar.gz \
&& mv openseadragon-bin-2.1.0 /var/www/imageserver/reader

ADD nginx.conf /etc/nginx/conf.d/default.conf 
ADD favicon.ico /var/www/imageserver/favicon.ico
ADD robots.txt /var/www/imageserver/robots.txt
