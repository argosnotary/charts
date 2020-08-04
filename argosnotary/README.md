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

| Parameter                                                       | Description                                                      | Default                                               |
|-----------------------------------------------------------------|------------------------------------------------------------------|-------------------------------------------------------|
| `oauth-stub.enabled`                                            | Enable the OAUTH stub(for development)                           | `false`                                               |
| `frontend.autoscaling.enabled`                                  | Enable hpa autoscaling                                           | `false`                                               |
| `frontend.ingress.hosts[0]`                                     | Hostname to the Argos Notary frontend                            | `argosnotary.local`                                   |
| `frontend.ingress.hosts[0].path`                                | Path within the url structure                                    | `/`                                                   |
| `frontend.ingress.tls[0].secretName`                            | TLS Secret Name                                                  | `frontend-tls-local-secret`                           |
| `frontend.ingress.tls[0].hosts[0]`                              | TLS hosts                                                        | `argosnotary.local`                                   |
| `service.autoscaling.enabled`                                   | Enable hpa autoscaling                                           | `false`                                               |
| `service.image.registry`                                        | Argos service image registry                                     | `docker.io`                                           |
| `service.secret.mongodb_uri.password`                           | The password used by the Argos Service on the MongoDB connection | `password`                                            |
| `service.secret.mongodb_uri.dbhost_and_port`                    | The host and port part of the MongoDB url                        | `argos-mongodb`                                       |
| `service.secret.oauth2.client.provider.azure.enabled`           | Enable Azure OAUTH                                               | `true`                                                |
| `service.secret.oauth2.client.registration.azure.clientId`      | The Azure App Client Id                                          | `client-id`                                           |
| `service.secret.oauth2.client.registration.azure.clientSecret`  | The Azure App Client Secret                                      | `client-secret`                                       |
| `service.secret.oauth2.client.provider.azure.authorizationUri`  | The Azure authorization uri endpoint                             | `http://oauthstub.local/oauth2/v2.0/authorize-manual` |
| `service.secret.oauth2.client.provider.azure.tokenUri`          | The Azure authorization token endpoint                           | `http://argos-oauthstub:8080/oauth2/v2.0/token`       |
| `service.secret.oauth2.client.provider.azure.userInfoUri`       | The Azure user profile endpoint                                  | `http://argos-oauthstub:8080/v1.0/me`                 |
| `service.secret.oauth2.client.provider.github.enabled`          | Enable Github OAUTH                                              | `false`                                               |
| `service.secret.oauth2.client.registration.github.clientId`     | The Github Client Id                                             | `nil`                                                 |
| `service.secret.oauth2.client.registration.github.clientSecret` | The Github Client Secret                                         | `nil`                                                 |
| `service.secret.oauth2.client.provider.google.enabled`          | Enable Google OAUTH                                              | `false`                                               |
| `service.secret.oauth2.client.registration.google.clientId`     | The Google Client Id                                             | `nil`                                                 |
| `service.secret.oauth2.client.registration.google.clientSecret` | The Google Client Secret                                         | `nil`                                                 |
| `service.auth.frontendRedirectBasePath`                         | Redirect url after authentication                                | `https://argosnotary.local`                           |
| `service.jwt.token.secret`                                      |  JWT Token used by the service                                   | ` `                                                   |
| `mongodb.enabled`                                               | Enable MongoDB                                                   | `true`                                                |
| `mongodb.image.registry`                                        | MongoDB image registry                                           | `docker.io`                                           |
| `mongodb.replicaSet.enabled`                                    | Switch to enable/disable replica set configuration               | `true`                                                | 
| `mongodb.mongodbRootPassword`                                   | The password used on the MongoDB connection                      | `password`                                            |
| `mongodb.persistence.size`                                      | Size of data volume                                              | `8Gi`                                                 |
  
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install argos \
  --set oauthstub.enabled=true,mongodb.mongodbRootPassword=secretpassword \
    argosnotary/argosnotary
```

The above command enables the oauth stub. Additionally sets the MongoDB `root` account password to `secretpassword`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install argos -f values.yaml argosnotary/argosnotary
```
