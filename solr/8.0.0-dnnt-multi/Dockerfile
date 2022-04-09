FROM solr:8.0.0-alpine

MAINTAINER Aleksei Ermak <aleksei@ermak.cz>

# Prepare Solr configuration
USER root
ADD lib /var/solr/data/lib/
ADD kramerius /kramerius
ADD oai /var/solr/data/oai

RUN chown -R $SOLR_USER:$SOLR_USER /kramerius

# In this configuration Solr is used in a standalone mode
# Check "solr.ReplicationHandler" in kramerius/conf/solrconfig.xml for more details
ENV ENABLE_MASTER false
ENV ENABLE_SLAVE false
ENV MASTER_URL localhost

# Make Solr use additional parameters
RUN echo 'SOLR_OPTS="$SOLR_OPTS \
          -Dsolr.enable.master="$ENABLE_MASTER" \
          -Dsolr.enable.slave="$ENABLE_SLAVE" \
          -Dsolr.master.url="$MASTER_URL" \
          -Ddisable.configEdit=true \
          -Dlog4j2.formatMsgNoLookups=true"' >> /etc/default/solr.in.sh

USER $SOLR_USER
CMD docker-entrypoint.sh solr-precreate kramerius /kramerius
