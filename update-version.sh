#!/usr/bin/env bash

NEW_VERSION="ca3957b591a21577a7eeaca207332c8a9aae6a6e"

if [ -z "$1" ]; then
  echo "New version not specified as first arg.  Using ${NEW_VERSION}.  Make sure that's what you want"
else
  echo "Setting new version to '${1}'"
  NEW_VERSION="$1"
fi

K8S_FILES=("k8s/staging/deploy.yaml" "k8s/prod/deploy.yaml")

for f in ${K8S_FILES[@]}; do
  sed -i -E -e "s|image: docker.io/freedomben/domain-namme-operator(.*):.*|image: docker.io/freedomben/domain-namme-operator:${NEW_VERSION}|g" "$f"
done
