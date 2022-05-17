#!/bin/bash

if test -f .env ; then
  source ../.env
fi

rm -rf ../node_modules
npm run clean:results

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
docker pull "${DOCKER_USERNAME}/visual-testing-demo:latest" || true
docker build --cache-from "${DOCKER_USERNAME}/visual-testing-demo:latest" -t "${DOCKER_USERNAME}/visual-testing-demo:latest" ..
docker push "${DOCKER_USERNAME}/visual-testing-demo:latest"