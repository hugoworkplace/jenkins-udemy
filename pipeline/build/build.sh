#!/bin/bash

# Copy the new jar to the build location
cp -f java-app/target/*.jar build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"

if [[ "$PWD" = *build ]]; 
then
	
	docker-compose -f docker-compose-build.yml build --no-cache
else
	cd build && docker-compose -f docker-compose-build.yml build --no-cache
fi
