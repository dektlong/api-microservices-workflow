#!/usr/bin/env bash

#simple pipeline to deploy app components, gateways and routes using Tanzu Build Service, Spring Cloud Gateway and Kustomize

case $1 in

deploy)
  kp image create {{microService1Name}} -n {{appName}} \
    --tag goharbor.io/{{appName}}/{{microService1Name}}:0.0.1 \
    --git {{microService1Git}} \
    --git-revision main \
    --builder {{appName}}-builder \
    --wait
  
  kp image create {{microService2Name}} -n {{appName}} \
    --tag goharbor.io/{{appName}}/{{microService2Name}}:0.0.1 \
    --git {{microService2Git}} \
    --git-revision main \
    --builder {{appName}}-builder \
     --wait
  
  kustomize build api-grid | kubectl apply -f -
  ;;

patch)
  kp image patch {{microService1Name}}
  
  kp image patch {{microService2Name}}
  
  kustomize build api-grid | kubectl apply -f -
  ;;

delete)
  kustomize build api-grid | kubectl delete -f -
  
  kp image delete {{microService1Name}}
  
  kp image delete {{microService2Name}}

*)
  # incorrect usage
  ;;
esac
