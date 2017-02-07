FROM fedora:latest

# Set the labels that are used for Openshift to describe the builder image.
LABEL authors="Daniel Secik <daniel.secik@mzk.cz>, Martin Rumanek <martin@rumanek.cz>"
      io.k8s.description="iipsrv" \
      io.k8s.display-name="iipsrv" \
      io.openshift.expose-services="9000:iip" \
      io.openshift.tags="builder,iipsrv" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

ENV LOGFILE=/tmp/iipsrv.log \
    CHILDREN=6 \
    PORT=9000 \
    FILESYSTEM_PREFIX=/data/ \
    VERBOSITY=2 \
    JPEG_QUALITY=90 \
    MAX_IMAGE_CACHE_SIZE=10 \
    MAX_CVT=30000 \
    MAX_LAYERS=10 \
    LD_LIBRARY_PATH=/usr/local/lib

RUN dnf -y install libtool gcc-c++ libjpeg-turbo-devel libtiff-devel spawn-fcgi git cmake
RUN mkfifo /tmp/iipsrv.log
 
COPY  ["run", "assemble", "/usr/libexec/s2i/"]



