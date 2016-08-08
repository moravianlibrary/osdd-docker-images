FROM gliderlabs/logspout:v3.1

RUN apk update
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Europe/Prague /etc/localtime
RUN echo "Europe/Prague" >  /etc/timezone
RUN apk del tzdata
