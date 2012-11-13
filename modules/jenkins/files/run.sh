#!/bin/sh

[ ! -f jenkins.war ] && wget http://mirrors.jenkins-ci.org/war/1.485/jenkins.war

mkdir /app/jenkins/tmp
exec java -Djava.io.tmpdir=/app/jenkins/tmp -jar jenkins.war \
  --httpPort=8001 \
  --httpListenAddress=127.0.0.1 \
  --prefix=/jenkins \
  --ajp13Port=-1 \
  --controlPort=-1
