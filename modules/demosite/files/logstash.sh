#!/bin/sh

url="https://logstash.objects.dreamhost.com/release/logstash-1.1.5-monolithic.jar"
file=`basename "$url"`

if [ ! -f "$file" ] ; then
  wget -O "$file" "$url"
fi

exec java -jar $file "$@"
