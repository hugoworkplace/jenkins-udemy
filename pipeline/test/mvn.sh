#!/bin/bash

echo "****************"
echo "***Test Jar*****"
echo "****************"

WORKSPACE=/home/hugo/jenkins/jenkins-data/jenkins_home/workspace/pipeline-maven-sample

docker run --rm  -v $WORKSPACE/java-app:/app -v $WORKSPACE/.m2/:/root/.m2/ -w /app maven:3.6-jdk-8-alpine "$@"
