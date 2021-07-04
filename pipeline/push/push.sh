#!/bin/bash
echo "****************************"
echo "********Pushing Image*******"
echo "****************************"

IMAGE="maven-sample"


echo "*** Logging In ***"
docker login -u hugoworkplace -p $PASS


echo "*** Tagging Image ***"
docker tag $IMAGE:$BUILD_TAG hugoworkplace/$IMAGE:$BUILD_TAG

echo "*** Pushing Image ***"
docker push hugoworkplace/$IMAGE:$BUILD_TAG
