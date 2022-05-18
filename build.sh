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

echo "logging in to Docker."

echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "pushing image"

docker push "$IMAGE_NAME"
