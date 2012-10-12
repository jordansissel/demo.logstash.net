#!/bin/sh

# From the 'ubuntu chef' docs
# http://wiki.opscode.com/display/chef/Installing+Chef+Client+on+Ubuntu+or+Debian

echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | tee /etc/apt/sources.list.d/opscode.list

mkdir -p /etc/apt/trusted.gpg.d
gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
gpg --export packages@opscode.com | tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null
apt-get update 

apt-get install -y chef

/etc/init.d/chef-client stop # I use chef-solo.
chmod 644 /etc/init.d/chef-client # Disable it
