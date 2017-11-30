FROM solr:6.3.0-alpine

MAINTAINER Martin Rumanek <martin@rumanek.cz>

USER root
ADD kramerius /kramerius
ADD lib /opt/solr/server/solr/lib
ADD oai/ /opt/solr/server/solr/oai

RUN chown -R $SOLR_USER:$SOLR_USER /kramerius
USER $SOLR_USER

CMD docker-entrypoint.sh solr-precreate  kramerius /kramerius 
