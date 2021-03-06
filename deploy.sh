#!/bin/bash

if test -f .env ; then
  source .env
fi

[ -z "$GOOGLE_PROJECT_ID" ] && echo "GOOGLE_PROJECT_ID not set" && exit 1
[ -z "$VERSION" ] && echo "VERSION not set" && exit 1

export GOOGLE_PROJECT_ID=$GOOGLE_PROJECT_ID
export VERSION=$VERSION


gcloud config set project "$GOOGLE_PROJECT_ID"

echo 'Starting kubernetes cluster'

gcloud container clusters create node-kubernetes \
  --num-nodes=1 --zone us-central1-a --machine-type g1-small

echo 'Getting google cloud credentials for the k8s cluster.'

gcloud container clusters get-credentials node-kubernetes --zone us-central1-a

echo 'creating a deployment of the app.'

# passes modified yaml to kubctl command
envsubst < ./kubernetes/deployment.yaml | kubectl create -f -

kubectl create -f ./kubernetes/service.yaml
