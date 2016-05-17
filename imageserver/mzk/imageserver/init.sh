#/bin/bash

/usr/bin/spawn-fcgi -f /usr/lib/cgi-bin/iipsrv.fcgi -p $PORT -F $CHILDREN
exec tail -F /tmp/iipsrv.log


