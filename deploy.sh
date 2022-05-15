source .env

[ -z "$PROJECT_ID" ] && echo "PROJECT_ID not set" && exit 1

gcloud config set project $PROJECT_ID

echo 'Starting kubernetes cluster'

# gcloud container clusters create node-kubernetes \
#   --num-nodes=1 --zone us-central1-a --machine-type g1-small

echo 'Getting google cloud credentials for the k8s cluster.'

gcloud container clusters get-credentials node-kubernetes --zone us-central1-a

echo 'creating a deployment of the app.'

kubectl create -f ./kubernetes/deployment.yaml
