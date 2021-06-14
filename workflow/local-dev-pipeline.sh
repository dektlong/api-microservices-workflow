#!/usr/bin/env bash

#simple pipeline to deploy app components, gateways and routes using Tanzu Build Service, Spring Cloud Gateway and Kustomize

case $1 in

deploy)
  kp image create {{appName}}-component1 -n {{appName}}-ns \
    --tag goharbor.io/{{appName}}/component1:0.0.1 \
    --git {{appComponent1Git}} \
    --git-revision main \
    --builder {{appName}}-builder \
    --wait
  
  kp image create {{appName}}-component2 -n {{appName}}-ns \
    --tag goharbor.io/{{appName}}/component2:0.0.1 \
    --git {{appComponent2Git}} \
    --git-revision main \
    --builder {{appName}}-builder \
     --wait
  
  kustomize build . | kubectl apply -f -
  ;;

patch)
  kp image patch {{appName}}-component1
  
  kp image patch {{appName}}-component2
  
  kustomize build . | kubectl apply -f -
  ;;

delete)
  kustomize build . | kubectl delete -f -
  
  kp image delete {{appName}}-component1
  
  kp image delete {{appName}}-component2

*)
  # incorrect usage
  ;;
esac
