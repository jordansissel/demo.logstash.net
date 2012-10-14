#!/bin/sh

[ ! -f jenkins.war ] && wget http://mirrors.jenkins-ci.org/war/1.485/jenkins.war

java -jar jenkins.war 
