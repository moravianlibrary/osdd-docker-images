#!/bin/sh
xmlstarlet ed -N x="http://www.fedora.info/definitions/1/0/config/" \
-s "//x:module[@role='org.fcrepo.server.resourceIndex.ResourceIndex']" -t elem -n "paramKrameriusTMP" -v "" \
-s "//x:module[@role='org.fcrepo.server.resourceIndex.ResourceIndex']" -t elem -n "paramOAITMP" -v "" \
-i "//paramKrameriusTMP" -t attr -n "name" -v "alias:kramerius" \
-i "//paramKrameriusTMP" -t attr -n "value" -v "http://www.nsdl.org/ontologies/relationships#" \
-s "//paramKrameriusTMP" -t elem -n "comment" -v "Alias for Kramerius" \
-r "//paramKrameriusTMP" -v "param" \
-i "//paramOAITMP" -t attr -n "name" -v "alias:oai" \
-i "//paramOAITMP" -t attr -n "value" -v "http://www.openarchives.org/OAI/2.0/" \
-s "//paramOAITMP" -t elem -n "comment" -v "Alias for OAI" \
-r "//paramOAITMP" -v "param" \
-u "//x:module[@role='org.fcrepo.server.resourceIndex.ResourceIndex']/x:param[@name='datastore']/@value" -v "localPostgresMPTTriplestore" \
/home/kramerius/fedora/server/config/fedora.fcfg  > /home/kramerius/fedora.fcfg

