FROM solr:6.3.0-alpine

MAINTAINER Martin Rumanek <martin@rumanek.cz>

USER root
RUN apk add --no-cache subversion
RUN svn export https://github.com/ceskaexpedice/kramerius/branches/oai4solr6/installation/oai4solr6/lib/ \
    /opt/solr/server/solr/lib/ --force
ADD kramerius /kramerius
ADD oai/ /opt/solr/server/solr/oai

RUN chown -R $SOLR_USER:$SOLR_USER /kramerius
USER $SOLR_USER

CMD docker-entrypoint.sh solr-precreate  kramerius /kramerius 
