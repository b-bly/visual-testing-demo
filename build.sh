#!/bin/bash

source .env

[ -z "$VERSION" ] && echo "VERSION not set" && exit 1
[ -z "$PROJECT_ID" ] && echo "PROJECT_ID not set" && exit 1

IMAGE_NAME=gcr.io/$PROJECT_ID/visual-testing-demo:$VERSION

rm -rf node_modules
npm run clean:results

echo "building docker image: $IMAGE_NAME"

docker build -t $IMAGE_NAME .

echo "pushing image"

docker push $IMAGE_NAME
