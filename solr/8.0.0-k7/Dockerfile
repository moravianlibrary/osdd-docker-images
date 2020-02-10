# Solr 8.0.0 with 'processing' index core for Kramerius6/7

FROM solr:8.0.0-alpine

MAINTAINER Aleksei Ermak <aleksei@ermak.cz>

USER root
ADD lib/ /var/solr/data/lib/
ADD oai/ /var/solr/data/oai
ADD kramerius /kramerius
ADD processing /processing
ADD precreate-kramerius-cores.sh /docker-entrypoint-initdb.d/precreate-kramerius-cores.sh

RUN chown -R $SOLR_USER:$SOLR_USER /kramerius
RUN chown -R $SOLR_USER:$SOLR_USER /processing
USER $SOLR_USER
