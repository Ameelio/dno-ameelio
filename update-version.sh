#!/usr/bin/env bash

NEW_VERSION="5974df2cabfa244d2cf7b8cba4a8c2fe4ba6af4a"

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
