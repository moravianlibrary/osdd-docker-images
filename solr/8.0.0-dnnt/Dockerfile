FROM solr:8.0.0-alpine

MAINTAINER Aleksei Ermak <aleksei@ermak.cz>

USER root
ADD lib /var/solr/data/lib/
ADD kramerius /kramerius
ADD oai /var/solr/data/oai

# fix for vulnerability CVE-2021-44228
RUN echo 'SOLR_OPTS="$SOLR_OPTS -Dlog4j2.formatMsgNoLookups=true -Ddisable.configEdit=true"' >> /etc/default/solr.in.sh

RUN chown -R $SOLR_USER:$SOLR_USER /kramerius
USER $SOLR_USER

CMD docker-entrypoint.sh solr-precreate  kramerius /kramerius
