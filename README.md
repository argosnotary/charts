# charts

```
$ helm package argos
$ mv argos-*.tgz docs
$ helm repo index docs
$ git add -i
$ git commit -av
$ git push origin master
```