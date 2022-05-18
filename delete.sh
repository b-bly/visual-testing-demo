#!/bin/bash

if test -f .env ; then
  source .env
fi

[ -z "$GOOGLE_PROJECT_ID" ] && echo "GOOGLE_PROJECT_ID not set" && exit 1
[ -z "$VERSION" ] && echo "VERSION not set" && exit 1

export GOOGLE_PROJECT_ID=$GOOGLE_PROJECT_ID
export VERSION=$VERSION

envsubst < ./kubernetes/service.yaml | kubectl delete -f -
envsubst < ./kubernetes/deployment.yaml | kubectl delete -f -
echo y | gcloud container clusters delete node-kubernetes --zone us-central1-a
