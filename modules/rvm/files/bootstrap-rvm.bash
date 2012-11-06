#!/usr/bin/env bash
#
# Usage: bootstrap-rvm.bash [branch]
# If not given, 'branch' defaults to 'stable'

set -e
branch=$1
[ -z "$branch" ] && branch=stable

USER="$(whoami)"
HOME="$(getent passwd "$USER" | awk -F: '{print $(NF-1)}')"

cd $HOME
export HOME

rvm="${HOME}/.rvm/scripts/rvm"
if [ ! -f "$rvm" ] ; then
  curl -L https://get.rvm.io | bash -s stable --ruby
else
  . "$rvm"
  rvm get $branch
fi