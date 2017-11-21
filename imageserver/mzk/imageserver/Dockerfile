FROM debian:stretch
MAINTAINER Daniel Secik <daniel.secik@mzk.cz>

RUN apt-get update && \
    apt-get install -y libjpeg-turbo-progs \
                       libtiff5 \
                       libgomp1 \
                       libmemcached11 \
                       spawn-fcgi && \
    rm -rf /var/lib/apt/lists/*

COPY iipimage-jp2-amd64.deb /iipimage-jp2-amd64.deb
RUN dpkg -i iipimage-jp2-amd64.deb && \
    rm iipimage-jp2-amd64.deb

ENV LOGFILE=/tmp/iipsrv.log
ENV CHILDREN=6
ENV PORT=9000
ENV FILESYSTEM_PREFIX=/data/
ENV VERBOSITY=2
ENV JPEG_QUALITY=90
ENV MAX_IMAGE_CACHE_SIZE=10
ENV MAX_CVT=30000
ENV MAX_LAYERS=10
ENV MEMCACHED_SERVERS=memcached

RUN mkfifo /tmp/iipsrv.log

COPY init.sh /init.sh

CMD /init.sh
