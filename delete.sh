kubectl delete -f ./kubernetes/node-service.yaml
kubectl delete -f ./kubernetes/node-deployment-updated.yaml
kubectl delete -f ./kubernetes/secret.yaml
kubectl delete -f ./kubernetes/volume-claim.yaml
kubectl delete -f ./kubernetes/volume.yaml
kubectl delete -f ./kubernetes/postgres-deployment.yaml
kubectl delete -f ./kubernetes/postgres-service.yaml
gcloud container clusters delete node-kubernetes --zone us-central1-a
gcloud compute disks delete pg-data-disk --zone us-central1-a
gcloud container images delete gcr.io/node-kubernetes-349713/node-kubernetes:v0.0.1
