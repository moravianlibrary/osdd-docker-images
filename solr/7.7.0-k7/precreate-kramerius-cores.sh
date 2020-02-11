#!/bin/bash
#
# Create cores on disk
set -e

echo "Creating Kramerius cores ..."

if [[ "${VERBOSE:-}" = "yes" ]]; then
    set -x
fi

/opt/docker-solr/scripts/precreate-core kramerius /kramerius
/opt/docker-solr/scripts/precreate-core processing /processing
