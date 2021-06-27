#!/usr/bin/env bash

#simple pipeline to deploy app components, gateways and routes using Tanzu Build Service, Spring Cloud Gateway and Kustomize

case $1 in

deploy)
  kp image create microservice1 -n app-name \
    --tag goharbor.io/app-name/microservice1:0.0.1 \
    --git microservice1-git \
    --git-revision main \
    --builder app-name-builder \
    --wait
  
  kp image create microservice2 -n app-name \
    --tag goharbor.io/app-name/microservice2:0.0.1 \
    --git microservice2-git \
    --git-revision main \
    --builder app-name-builder \
     --wait
  
  kustomize build api-grid | kubectl apply -f -
  ;;

patch)
  kp image patch microservice1
  
  kp image patch microservice2
  
  kustomize build api-grid | kubectl apply -f -
  ;;

delete)
  kustomize build api-grid | kubectl delete -f -
  
  kp image delete microservice1
  
  kp image delete microservice2

*)
  # incorrect usage
  ;;
esac
