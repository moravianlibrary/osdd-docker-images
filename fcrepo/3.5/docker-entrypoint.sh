#!/bin/bash

if [ -n "$FEDORA_PASSWORD" ] ; then
  xmlstarlet ed  --inplace -u "/users/user/@password" -v $FEDORA_PASSWORD $FEDORA_HOME/server/config/fedora-users.xml 
fi

exec "$@"
