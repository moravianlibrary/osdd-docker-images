#!/bin/bash
sed -i -e "s|\${FEDORA_URL}|$FEDORA_URL|" \
       -e "s|\${FEDORA_USER}|$FEDORA_USER|" \
       -e "s|\${FEDORA_PASS}|$FEDORA_PASS|" \
       -e "s|\${FEDORA_JDBC_URL}|$FEDORA_JDBC_URL|" \
       -e "s|\${FEDORA_JDBC_USER}|$FEDORA_JDBC_USER|" \
       -e "s|\${FEDORA_JDBC_PASS}|$FEDORA_JDBC_PASS|" \
       "$CATALINA_HOME/webapps/oaiprovider/WEB-INF/classes/proai.properties"

exec "$@"
