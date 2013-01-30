#!/bin/sh

url="https://logstash.objects.dreamhost.com/release/logstash-1.1.9-monolithic.jar"
file=`basename "$url"`

if [ ! -f "$file" ] ; then
  wget -O "$file" "$url"
fi

if [ ! -f "server.crt" -o ! -f "server.key" ] ; then
  rm -f server.{crt,key,csr}
  openssl genrsa -out server.key 2048
  openssl req -new -key server.key -batch -out server.csr
  openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
fi

exec java -jar $file "$@"
