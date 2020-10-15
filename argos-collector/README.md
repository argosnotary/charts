# Argos Notary Collector Base

This is the base used in the different types of collectors. 

## Introduction

This is used as base for other collectors in [Argos Notary](https://github.com/argosnotary). The value `collector.type`defines which collector it is.

## Parameters

The following table lists the configurable parameters of the MongoDB chart and their default values.

| Parameter                                   | Description                                                            | Default                               |
|---------------------------------------------|------------------------------------------------------------------------|---------------------------------------|
| `replicacount`                              | Replica count of argos collector                                       | `1`                                   |
| `image.registry`                            | Image registry                                                         | `docker.io`                           |
| `image.repository`                          | Image repository                                                       | `argosnotary/argos-collector-service` |
| `collector.type`                            | Type used in the `argos-collector`, `GIT` or `XLDEPLOY`                | GIT                                   |
| `collector.baseurl`                         | URL of the XL Deploy server this collector refers to                   | `nil`                                 |
| `key_value_map`                             | Name of the key, value configuration map used in the `argos-collector` | `argos-collector-key-value-map`       |
| `ingress.hosts[0]`                          | Hostname to the Argos Collector                                        | `argos-collector.local`               |
| `ingress.hosts[0].path`                     | Path within the url structure                                          | `/`                                   |
| `ingress.tls[0].secretName`                 | TLS Secret Name                                                        | `argos-collector-tls-local-secret`    |
| `ingress.tls[0].hosts[0]`                   | TLS hosts                                                              | `argos-collector.local`               |
| `autoscaling.enabled`                       | Enable hpa autoscaling                                                 | `false`                               |

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
