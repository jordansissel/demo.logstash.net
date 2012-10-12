#!/bin/sh

adduser --disabled-password --gecos "puppet" puppet
apt-get install -y ruby1.8-dev rubygems
gem install --no-ri --no-rdoc puppet facter
