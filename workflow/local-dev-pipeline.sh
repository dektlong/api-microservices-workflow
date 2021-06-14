#!/usr/bin/env bash

#simple pipeline to deploy app components, gateways and routes using Tanzu Build Service, Spring Cloud Gateway and Kustomize

case $1 in

deploy)
  kp image create {{appName}}-microService1 -n {{appName}}-ns \
    --tag goharbor.io/{{appName}}/microService1:0.0.1 \
    --git {{microService1Git}} \
    --git-revision main \
    --builder {{appName}}-builder \
    --wait
  
  kp image create {{appName}}-microService2 -n {{appName}}-ns \
    --tag goharbor.io/{{appName}}/microService2:0.0.1 \
    --git {{microService2Git}} \
    --git-revision main \
    --builder {{appName}}-builder \
     --wait
  
  kustomize build . | kubectl apply -f -
  ;;

patch)
  kp image patch {{appName}}-microService1
  
  kp image patch {{appName}}-microService1
  
  kustomize build . | kubectl apply -f -
  ;;

delete)
  kustomize build . | kubectl delete -f -
  
  kp image delete {{appName}}-microService1
  
  kp image delete {{appName}}-microService2

*)
  # incorrect usage
  ;;
esac
