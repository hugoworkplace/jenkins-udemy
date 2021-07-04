#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export DOCKERHUB_PASS=$(sed -n '3p' /tmp/.auth)

docker login -u hugoworkplace -p $DOCKERHUB_PASS
cd ~/maven-sample && docker-compose up -d
