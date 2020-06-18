# Argos Notary XLDeploy Dar file collector

This collector collects all artifacts part of a XL Deploy Deployment Package. 

## TL;DR;

```bash
$ helm repo add argosnotary https://argosnotary.github.io/charts
$ helm repo update
$ helm install my-release argosnotary/xldeploy-argos-collector --set collector.baseurl="http://<xldeploy host and port>"
```

## Deploy on minikube

## Introduction

This chart bootstraps a [Argos Notary](https://github.com/argosnotary) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.13+
- Helm 3.1+

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release argosnotary/xldeploy-argos-collector --set collector.baseurl="http://<xldeploy host and port>"
```

The command deploys XL Deploy collector on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the MongoDB chart and their default values.

| Parameter                                   | Description                                                            | Default                            |
|---------------------------------------------|------------------------------------------------------------------------|------------------------------------|
| `collector.type`                            | Type used in the `argos-collector`                                     | XLDEPLOY                           |
| `collector.baseurl`                         | URL of the XL Deploy server this collector refers to                   | `nil`                              |
| `argos-collector.key_value_map`             | Name of the key, value configuration map used in the `argos-collector` | `xldeploy-collector-key-value-map` |
| `argos-collector.replicacount`              | Replica count of argos collector                                       | `1`                                |
| `argos-collector.image.registry`            | Image registry                                                         | `docker.io`                        |
| `argos-collector.ingress.hosts[0]`          | Hostname to the Argos Collector                                        | `argos-collector.local`            |
| `argos-collector.ingress.hosts[0].path`     | Path within the url structure                                          | `/`                                |
| `argos-collector.ingress.tls[0].secretName` | TLS Secret Name                                                        | `argos-collector-tls-local-secret` |
| `argos-collector.ingress.tls[0].hosts[0]`   | TLS hosts                                                              | `argos-collector.local`            |
| `argos-collector.autoscaling.enabled`       | Enable hpa autoscaling                                                 | `false`                            |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
  --set collector.baseurl=http://xldeploy:4516 \
    argosnotary/xldeploy-argos-collector
```

The above command sets the url of the XL Deploy server on which the Deployment Packages should be collected.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml argosnotary/xldeploy-argos-collector
```
