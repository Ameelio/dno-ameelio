#!/usr/bin/env bash

#NEW_VERSION="2021-08-19"
#NEW_VERSION="$(date '+%Y-%m-%d-%H-%M-%S')"
NEW_VERSION="$(date '+%Y%m%d%H%M%S')"

K8S_FILES=("k8s/staging/deploy.yaml" "k8s/prod/deploy.yaml")

for f in $(findref --no-color '^LATEST_VERSION' | awk -F : '{ print $1 }' | sort | uniq); do
  sed -i -e "s/^LATEST_VERSION=.*/LATEST_VERSION='${NEW_VERSION}'/g" "$f"
done

#for f in ${K8S_FILES[@]}; do
#  sed -i -E -e "s|image: registry.digitalocean.com/ameelio-registry/tls-cert-renewal-(.*):.*|image: registry.digitalocean.com/ameelio-registry/tls-cert-renewal-\1:${NEW_VERSION}|g" "$f"
#done

for f in ${K8S_FILES[@]}; do
  sed -i -E -e "s|image: registry.digitalocean.com/ameelio-registry/tls-cert-renewal(.*):.*|image: registry.digitalocean.com/ameelio-registry/tls-cert-renewal:${NEW_VERSION}|g" "$f"
done
