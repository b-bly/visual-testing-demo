#!/bin/bash

if test -f .env ; then
  source .env
fi

[ -z "$VERSION" ] && echo "VERSION not set" && exit 1
[ -z "$GOOGLE_PROJECT_ID" ] && echo "GOOGLE_PROJECT_ID not set" && exit 1

IMAGE_NAME=gcr.io/$GOOGLE_PROJECT_ID/visual-testing-demo:$VERSION

rm -rf node_modules
rm -rf mochawesome-report
rm -rf mochawesome.json

echo "building docker image: $IMAGE_NAME"

docker build -t "$IMAGE_NAME" .

echo "pushing image"

docker push "$IMAGE_NAME"
