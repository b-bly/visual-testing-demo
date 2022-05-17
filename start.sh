#!/bin/bash

source .env

npx concurrently "npm start" "bash runCypress.sh"
npm run 
# TODO cleanup
