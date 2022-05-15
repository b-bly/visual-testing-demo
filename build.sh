source .env

[ -z "$VERSION" ] && echo "VERSION not set" && exit 1
[ -z "$PROJECT_ID" ] && echo "PROJECT_ID not set" && exit 1

npm run clean:results
gcloud auth configure-docker
docker build -t gcr.io/$PROJECT_ID/node-kubernetes:$VERSION .
docker push gcr.io/$PROJECT_ID/node-kubernetes:$VERSION
