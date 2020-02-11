# Solr 7.7.0 with 'processing' index core for Kramerius6/7

FROM solr:7.7.0-alpine

MAINTAINER Aleksei Ermak <aleksei@ermak.cz>

USER root
ADD lib/ /opt/solr/server/solr/lib
ADD oai/ /opt/solr/server/solr/oai
ADD kramerius /kramerius
ADD processing /processing
ADD precreate-kramerius-cores.sh /docker-entrypoint-initdb.d/precreate-kramerius-cores.sh

RUN chown -R $SOLR_USER:$SOLR_USER /kramerius
RUN chown -R $SOLR_USER:$SOLR_USER /processing
USER $SOLR_USER
