# Visual Testing Demo
An example for running Cypress with Apli Tools on a Kubernetes cluster in GCP.

## Kubernetes notes
minikube memory error
https://stackoverflow.com/questions/63388065/minikube-kubernetes-wont-allow-ingress-on-mac-despite-running-as-a-vm 

```
minikube start --vm=true --driver=hyperkit
envsubst < ./kubernetes/deployment.yaml | mkc create -f -
```

node kubernetes example
https://testdriven.io/blog/deploying-a-node-app-to-google-cloud-with-kubernetes/ 


Terraform makefile auth 
https://jryancanty.medium.com/stop-downloading-google-cloud-service-account-keys-1811d44a97d9 


get first pod id
```
 kubectl get pods | awk 'NR==2{print $1}’
```

```
% docker exec -it <container_id> /bin/sh
```  

## Architecture
Each pod executes a visual test with a different library against a site
Pull test from a queue?
Each pod is a different image

## Features
- [x] run locally on minikube
- [x] run on gke
- [x] automate image building with gitlab? github?
- [x] Automate test with circleCI? https://medium.com/devopscurry/jenkins-is-getting-old-so-what-are-the-alternatives-in-2021-fd6ce6707465  
- [x] yaml lint
- [ ] Send exit signal from k8s pod
- [ ] Delete deployment from ci
- [ ] Collect test results
- [ ] Display test results
- [ ] Save result history in gcp
- [ ] Parallel run based on time.

gcloud secrets
https://cloud.google.com/secret-manager/docs/creating-and-accessing-secrets

get secret from google cloud
APPLITOOLS_API_KEY=$(gcloud secrets versions access latest --secret="APPLITOOLS_API_KEY")

shellcheck wiki
https://github.com/koalaman/shellcheck/wiki/Ignore


### CircleCi notes

Paths referenced in ci must be relative to project, not yaml location.

correct: 
```
  command: bash hello.sh
```
incorrect:
```
  command: bash ../hello.sh
bash: ../hello.sh: No such file or directory
```


### To Do

deploy a containerized web app
https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app

configure domain names with static ip addresses
https://cloud.google.com/kubernetes-engine/docs/tutorials/configuring-domain-name-static-ip

set up dns records for a domain name with cloud DNS
https://cloud.google.com/dns/docs/set-up-dns-records-domain-name#create_a_new_record

