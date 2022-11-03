#!/usr/bin/env bash

NEW_VERSION="db2ae2bd0291c4d0bcd1c6956c7f0bf0d2c715b0"

if [ -z "$1" ]; then
  echo "New version not specified as first arg.  Using ${NEW_VERSION}.  Make sure that's what you want"
else
  echo "Setting new version to '${1}'"
  NEW_VERSION="$1"
fi

K8S_FILES=("k8s/staging/deploy.yaml" "k8s/prod/deploy.yaml")

for f in ${K8S_FILES[@]}; do
  echo "Updating version in file $f"
  sed -i -E -e "s|image: docker.io/freedomben/domain-name-operator(.*):.*|image: docker.io/freedomben/domain-name-operator:${NEW_VERSION}|g" "$f"
done
