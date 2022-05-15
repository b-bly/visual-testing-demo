source .env
[ -z "$PROJECT_ID" ] && echo "PROJECT_ID not set" && exit 1
[ -z "$VERSION" ] && echo "VERSION not set" && exit 1

export PROJECT_ID=$PROJECT_ID
export VERSION=$VERSION

envsubst < ./kubernetes/service.yaml | kubectl delete -f -
envsubst < ./kubernetes/deployment.yaml | kubectl delete -f -
y | gcloud container clusters delete node-kubernetes --zone us-central1-a
