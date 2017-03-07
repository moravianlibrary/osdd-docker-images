FROM fedora:latest

# Set the labels that are used for Openshift to describe the builder image.
LABEL authors="Martin Rumanek <martin@rumanek.cz>" \
      io.k8s.description="mirador" \
      io.k8s.display-name="mirador" \
      io.openshift.expose-services="8080:meditor" \
      io.openshift.tags="mirador" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

RUN INSTALL_PKGS="nodejs tar bzip2 python gcc-c++ gyp cairo-devel python nginx giflib-devel git" && \
    dnf install -y $INSTALL_PKGS && \
    dnf clean all -y

ADD index.html /usr/share/nginx/html/index.html

RUN npm install -g grunt
ENV HOME=/opt/app-root/src
RUN mkdir -p $HOME

RUN chown -R 1001:0 $HOME /usr/share/nginx/html/  /var/log/nginx/ /var/lib/nginx
RUN chmod -R go=u+rw $HOME /usr/share/nginx/html/ /var/log/nginx/ /var/lib/nginx

USER 1001
EXPOSE 80

COPY  ["run", "assemble", "/usr/libexec/s2i/"]


