#!/bin/sh

if ! which puppet > /dev/null 2>&1 ; then
  sh bootstrap.sh
fi

puppet apply --color=false --modulepath modules site.pp \
  | tee /dev/stderr \
  | /opt/lumberjack/bin/lumberjack.sh --ssl-ca-path ./lumberjack.crt \
       --host localhost --port 5005 --field type=puppet \
       --field run=`date +%s` -
