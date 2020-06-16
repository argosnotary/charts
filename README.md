# Argos Notary Helm charts

## Development

### Create a development environment
```
$ git clone https://github.com/argosnotary/charts.git
$ docker run -ti -p 80:80 -v $PWD/docs:/usr/share/nginx/html:ro --rm nginx
$ helm repo add argosnotary http://localhost
$ helm repo update
```bash

### Create new helm package

```bash
$ helm package argos
$ mv *.tgz docs
$ helm repo index docs
$ helm repo update
```

### Release new Helm package

```bash
$ git add -i
$ git commit -av
$ git push origin master
```