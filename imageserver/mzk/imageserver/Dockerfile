FROM debian:stretch
LABEL maintainer="stepanovsky@mzk.cz"

RUN groupadd -g 999 iipimage && \
    useradd -r -u 999 -g iipimage iipimage

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

COPY init.sh /init.sh
RUN chmod +x /init.sh

USER iipimage
RUN mkfifo /tmp/iipsrv.log

CMD /init.sh
