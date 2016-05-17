#!/bin/bash

if [ ! -d "/kramerius-data/foxml-import" ]; then
  mkdir /kramerius-data/foxml-import
  mv /tmp/8ffd7a5b-82da-11e0-bc9f-0050569d679d /kramerius-data/foxml-import/
fi

if [ ! -d "/kramerius-data/postgres-data" ]; then
  mkdir /kramerius-data/postgres-data
  mv /var/lib/postgresql/9.1/main /kramerius-data/postgres-data/main
fi

if [ ! -d "/kramerius-data/fedora-data" ]; then
  mv /home/kramerius/fedora/dataDefault /kramerius-data/fedora-data
fi

if [ ! -d "/kramerius-data/solr-data" ]; then
  mv /home/kramerius/solr/dataDefault /kramerius-data/solr-data
fi
if [ ! -d "/kramerius-data/.kramerius4" ]; then
  NEW_RANDOM_FEDORA_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
  mv /home/kramerius/.kramerius4Default /kramerius-data/.kramerius4
  sed "s/fedoraPass=fedoraAdmin/fedoraPass=$NEW_RANDOM_FEDORA_PASSWORD/" /kramerius-data/.kramerius4/configuration.properties > /kramerius-data/.kramerius4/configuration.properties_with_new_password
  mv /kramerius-data/.kramerius4/configuration.properties_with_new_password /kramerius-data/.kramerius4/configuration.properties
fi

if [ -d "/kramerius-data/.kramerius4" ]; then
  FEDORA_PASSWORD=$(parser.sh fedoraPass /kramerius-data/.kramerius4/configuration.properties)
  xmlstarlet ed -u "/users/user/@password" -v $FEDORA_PASSWORD /home/kramerius/fedora/server/config/fedora-users.xml > fedora-users.xml
  mv fedora-users.xml /home/kramerius/fedora/server/config/fedora-users.xml
fi

if [ ! -d "/kramerius-data/imageserver" ]; then
  mkdir /kramerius-data/imageserver
fi

if [ -f "/kramerius-data/.kramerius4/key.rsa.pub" ]; then
  mkdir /home/kramerius/.ssh/
  cat /kramerius-data/.kramerius4/key.rsa.pub > /home/kramerius/.ssh/authorized_keys
  chown -R kramerius:kramerius /home/kramerius/.ssh
  chmod -R go-rwx /home/kramerius/.ssh
  /etc/init.d/ssh start
fi

/etc/init.d/postgresql start
/etc/init.d/apache2 start
su -l -m kramerius -c "/home/kramerius/tomcat/bin/startup.sh"

# change kramerius appearance
if [  -d "/kramerius-data/appearance" ]; then
  cp -r /kramerius-data/appearance/* /home/kramerius/tomcat/webapps/search/
fi


while :; do /bin/bash; sleep 1; done

