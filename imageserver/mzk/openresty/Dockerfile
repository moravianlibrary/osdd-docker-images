FROM openshift/base-centos7

MAINTAINER Daniel Secik <daniel.secik@mzk.cz>

ENV OPENRESTY_DOWNLOAD_URL https://openresty.org/download/openresty-1.11.2.1.tar.gz
ENV OPENSEADRAGON_DOWNLOAD_URL https://github.com/openseadragon/openseadragon/releases/download/v2.2.1/openseadragon-bin-2.2.1.tar.gz

RUN yum install -y readline-devel pcre-devel openssl-devel gcc wget nano && yum clean all -y

RUN mkdir /openresty && \
    curl $OPENRESTY_DOWNLOAD_URL | tar -xz -C /openresty --strip-components=1

WORKDIR /openresty
RUN ./configure --with-http_realip_module && \
    make && \
    make install && \
    useradd -s /bin/bash nginx

WORKDIR /
RUN rm -rf /openresty && \
    mkdir -p /var/www/imageserver/reader && \
    curl -L $OPENSEADRAGON_DOWNLOAD_URL | tar -xz -C /var/www/imageserver/reader --strip-components=1 

COPY index.html /var/www/imageserver/reader/reader.html
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY favicon.ico /var/www/imageserver/favicon.ico
COPY robots.txt /var/www/imageserver/robots.txt

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log && \
    ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log

CMD ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]
