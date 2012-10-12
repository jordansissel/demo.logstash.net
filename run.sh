#!/bin/sh

if ! which puppet > /dev/null 2>&1 ; then
  sh bootstrap.sh
fi

puppet apply --modulepath modules site.pp
