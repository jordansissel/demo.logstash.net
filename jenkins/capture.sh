#!/bin/sh

rsync -mavt --exclude 'jobs/plugin.*' --include '*/' --exclude 'plugin.*' --include 'config.xml' --exclude '*' /app/jenkins/.jenkins/jobs .

