#!/bin/bash

echo maven-sample > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $DOCKERHUB_PASS >> /tmp/.auth

if [[ "$PWD" = *deploy ]] ; 
then
        scp -i /opt/prod-key /tmp/.auth prod-user@production:/tmp/.auth 
        scp -i /opt/prod-key ./publish.sh prod-user@production:/tmp/publish.sh
        ssh -i /opt/prod-key prod-user@production "chmod +x /tmp/publish.sh"
        ssh -i /opt/prod-key prod-user@production "/tmp/publish.sh"

else
        cd deploy 
	scp -i /opt/prod-key /tmp/.auth prod-user@production:/tmp/.auth
        scp -i /opt/prod-key ./publish.sh prod-user@production:/tmp/publish.sh
        ssh -i /opt/prod-key prod-user@production "chmod +x /tmp/publish.sh"
        ssh -i /opt/prod-key prod-user@production "/tmp/publish.sh"

fi
