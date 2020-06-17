# Argos Notary

Argos Notary is service which provides provenance of software packages.

## TL;DR;

```bash
$ helm repo add argosnotary https://argosnotary.github.io/charts
$ helm repo update
$ helm install my-release argosnotary/argosnotary
```

## Deploy on minikube

## Introduction

This chart bootstraps a [Argos Notary](https://github.com/argosnotary) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.13+
- Helm 3.1+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release argosnotary/argosnotary
```

The command deploys Argos Notary on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the MongoDB chart and their default values.

| Parameter                              | Description                                                      | Default                          |
|----------------------------------------|------------------------------------------------------------------|----------------------------------|
| `oauth-stub.enabled`                   | Enable the OAUTH stub                                            | `true`                           |
| `frontend.image.registry`              | Argos frontend image registry                                    | `docker.io`                      |
| `frontend.ingress.hosts[0]`            | Hostname to the Argos Notary frontend                            | `argosnotary.local`              |
| `frontend.ingress.hosts[0].path`       | Path within the url structure                                    | `/`                              |
| `frontend.ingress.tls[0].secretName`   | TLS Secret Name                                                  | `frontend-tls-local-secret`      |
| `frontend.ingress.tls[0].hosts[0]`     | TLS hosts                                                        | `argosnotary.local`              |
| `service.image.registry`               | Argos service image registry                                     | `docker.io`                      |
| `service.secret.mongodb_uri.password`  | The password used by the Argos Service on the MongoDB connection | `password`                       |
| `aad.client_provider_oauth_url_prefix` | The Azure AD OAUTH endpoint                                      | `http://oauthstub.local`         |
| `aad.client_provider_user_info_url`    | The Azure AD user info endpoint                                  | `http://oauthstub.local/v1.0/me` |
| `aad.client_secret`                    | The Azure AD client secret                                       | `client-secret`                  |
| `aad.client_id`                        | The Azure AD client identifier                                   | `client-id`                      |
| `aad.authorizationUri`                 | The OAUTH authorization uri                                      | `oauth2/v2.0/authorize-manual`   |
| `aad.tokenUri`                         | The OAUTH token uri                                              | `oauth2/v2.0/token`              |
| `aad.frontendRedirectBasePath`         | The url to wich should be redirected after authenitcation        | `https://argos.local`            |
| `aad.jwt_token`                        | The JWT token                                                    | `base64 encode string`           |
| `mongodb.enabled`                      | Enable MongoDB                                                   | `true`                           |
| `mongodb.image.registry`               | MongoDB image registry                                           | `docker.io`                      |
| `mongodb.replicaSet.enabled`           | Switch to enable/disable replica set configuration               | `true`                           | 
| `mongodb.mongodbRootPassword`          | The password used on the MongoDB connection                      | `password`                       |
| `mongodb.persistence.size`             | Size of data volume                                              | `8Gi`                            |
  
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
  --set oauthstub.enabled=true,oauthstub.ip=172.17.0.4,mongodb.mongodbRootPassword=secretpassword \
    argosnotary/argosnotary
```

The above command enables the oauth stub. Additionally sets the MongoDB `root` account password to `secretpassword`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml argosnotary/argosnotary
```
