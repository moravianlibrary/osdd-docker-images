FROM solr:8.0.0-alpine

MAINTAINER Aleksei Ermak <aleksei@ermak.cz>

USER root
ADD lib/ /var/solr/data/lib/
ADD kramerius /kramerius
ADD oai/ /var/solr/data/oai

RUN chown -R $SOLR_USER:$SOLR_USER /kramerius
USER $SOLR_USER

CMD docker-entrypoint.sh solr-precreate  kramerius /kramerius 