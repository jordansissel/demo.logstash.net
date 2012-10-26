#!/bin/sh

if ! which puppet > /dev/null 2>&1 ; then
  sh bootstrap.sh
fi

puppet apply --modulepath modules site.pp \
  | /opt/lumberjack/bin/lumberjack.sh --ssl-ca-path ./lumberjack.crt --host localhost --port 5005 --field type=puppet -
