#!/bin/bash
set -e
charts=
if [ -z "$1" ]; then
   echo "No options, will package all"
   charts=(argos-collector xldeploy-argos-collector git-argos-collector oauthstub argosnotary)
else
  charts=($1)
fi

echo "Going to package charts ${charts[*]}"

chartmuseum=$(docker ps -qf name=chartmuseum)
if [ -z "${chartmuseum}" ]; then
   helm repo index docs
   docker run -d --name chartmuseum -p 80:80 -v $PWD/docs:/usr/share/nginx/html:ro --rm nginx
   sleep 5
   helm repo add argosnotary http://localhost
   if [ "$?" -ne 0 ]; then
     exit 8
   fi
   helm repo update
fi
for chart in ${charts[*]}; do
   helm package ${chart}
   mv *.tgz docs/
   helm repo index docs
   helm repo update
done