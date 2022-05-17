#!/bin/bash

if test -f .env ; then
  source .env
fi

npx concurrently "npm start" "bash runCypress.sh"
npm run 
# TODO cleanup
