#!/bin/sh

if ! which chef-solo > /dev/null 2>&1 ; then
  sh bootstrap.sh
fi

chef-solo -c solo.rb -j node.json
