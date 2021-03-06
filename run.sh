#!/bin/sh

have() { 
  which "$1" > /dev/null 2>&1 
}

# Some distros put gem bins in dumb places. Make sure they're in the path
if have gem ; then
  gembin=$(gem env | awk '/EXECUTABLE DIRECTORY:/ { print $NF }')
  PATH="${PATH}:${gembin}"
fi

# Bootstrap puppet if we don't have it.
have puppet || sh bootstrap.sh

# Include the logstash demo services
export FACTER_demo=true

# Now run puppet.
export LANG=en_US.UTF-8
puppet apply --color=false --modulepath modules site.pp 
