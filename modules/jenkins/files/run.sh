#!/bin/sh

version="1.506"
#1.502 checksum="1ff9ccc717be382d0cff23addc88dc2c5f891922130e0df134d3a16ab791fb0c"
checksum="6fd6e159b8227bcc705adaee20e8573bb2667435875f8a40539b14e3c726be91"

if [ ! -f jenkins.war ] ; then
  wget http://mirrors.jenkins-ci.org/war/${version}/jenkins.war
fi

computed_checksum="$(sha256sum jenkins.war | awk '{print $1}')"
if [ "$computed_checksum" != "$checksum" ] ; then
  echo "Checksum mismatch"
  echo "Expected (for version $version): ${checksum}"
  echo "Actual: ${computed_checksum}"
  echo "Removing bad jenkins.war"
  rm jenkins.war

  sleep 60
  exit 1
fi

mkdir /app/jenkins/tmp
exec java -Djava.io.tmpdir=/app/jenkins/tmp -jar jenkins.war \
  --httpPort=8001 \
  --httpListenAddress=127.0.0.1 \
  --ajp13Port=-1 \
  --controlPort=-1

  #--prefix=/jenkins \
