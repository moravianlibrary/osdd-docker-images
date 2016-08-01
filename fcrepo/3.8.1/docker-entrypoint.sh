#!/bin/bash

if [ -n "$FEDORA_PASSWORD" ] ; then
  xmlstarlet ed  --inplace -u "/users/user/@password" -v $FEDORA_PASSWORD $FEDORA_HOME/server/config/fedora-users.xml 
fi

if [ -n "$FEDORA_DB_HOST" ] ; then
  xmlstarlet ed -L -N x="http://www.fedora.info/definitions/1/0/config/" \
    -u "//x:datastore[@id='localPostgreSQLPool']/x:param[@name='jdbcURL']/@value" -v "jdbc:postgresql://$FEDORA_DB_HOST/fedora3" $FEDORA_HOME/server/config/fedora.fcfg
fi

if [ -n "$FEDORA_DB_USER" ] ; then
  xmlstarlet ed -L -N x="http://www.fedora.info/definitions/1/0/config/" \
    -u "//x:datastore[@id='localPostgreSQLPool']/x:param[@name='dbUsername']/@value" -v $FEDORA_DB_USER $FEDORA_HOME/server/config/fedora.fcfg
fi

if [ -n "$FEDORA_DB_PASSWORD" ] ; then
  xmlstarlet ed -L -N x="http://www.fedora.info/definitions/1/0/config/" \
    -u "//x:datastore[@id='localPostgreSQLPool']/x:param[@name='dbPassword']/@value" -v $FEDORA_DB_PASSWORD $FEDORA_HOME/server/config/fedora.fcfg
fi

if [ -n "$RITRIPLES_DB_HOST" ] ; then
  xmlstarlet ed -L -N x="http://www.fedora.info/definitions/1/0/config/" \
    -u "//x:datastore[@id='localPostgresMPTTriplestore']/x:param[@name='jdbcURL']/@value" -v "jdbc:postgresql://$RITRIPLES_DB_HOST/riTriples" $FEDORA_HOME/server/config/fedora.fcfg
fi

if [ -n "$RITRIPLES_DB_USER" ] ; then
  xmlstarlet ed -L -N x="http://www.fedora.info/definitions/1/0/config/" \
    -u "//x:datastore[@id='localPostgresMPTTriplestore']/x:param[@name='username']/@value" -v $RITRIPLES_DB_USER $FEDORA_HOME/server/config/fedora.fcfg
fi

if [ -n "$RITRIPLES_DB_PASSWORD" ] ; then
  xmlstarlet ed -L -N x="http://www.fedora.info/definitions/1/0/config/" \
    -u "//x:datastore[@id='localPostgresMPTTriplestore']/x:param[@name='password']/@value" -v $RITRIPLES_DB_PASSWORD $FEDORA_HOME/server/config/fedora.fcfg
fi



exec "$@"
