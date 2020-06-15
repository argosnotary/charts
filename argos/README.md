# Argos Notary

Argos Notary is service which provides provenance of software packages.

## TL;DR;

## Deploy on minikube

### Prerequisites

* minikube [download](https://kubernetes.io/docs/tasks/tools/install-minikube/)
* kubectl [download](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* helm3 [download](https://helm.sh/docs/intro/install/)

### init

```bash

$ minikube start
$ minikube ip
$ minikube addons enable ingress

```

### activate

```bash

$ helm install <release> argos

```

add to hosts file

```
   <minikube ip>  <release>-frontend.minikube.local
   <minikube ip>  <release>-oauth-stub.minikube.local
```

Go to the Argos Dashboard with url https://&lt;release&gt;-frontend.minikube.local
   



### Deploy on GKE

```bash
$ gcloud projects create argosnotary-test

$ gcloud container clusters create argosnotary-test --num-nodes=1 --region europe-west1

$ helm install argos argos \
    --set service.secret.aad.azure_client_secret='...' \
    --set service.secret.aad.azure_client_id='...' \
    --set service.secret.aad.azure_tenant_id='...' \
    --set service.secret.jwt_token='...' \
    --set global.platform='...'
```

## Parameters

docker run -ti -p 8080:8080 \
-v xxx:/storage
-e CHART_POST_FORM_FIELD_NAME=chart \
-e DISABLE_METRICS=true  \
-e LOG_JSON=true \
-e PROV_POST_FORM_FIELD_NAME=prov \
-e STORAGE=local \
-e DISABLE_API=false \
chartmuseum/chartmuseum:v0.12.0 --port=8080 --storage-local-rootdir=/storage


    