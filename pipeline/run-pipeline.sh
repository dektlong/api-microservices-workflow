#!/usr/bin/env bash

#simple pipeline to deploy app components, gateways and routes using Tanzu Build Service, Spring Cloud Gateway and Kustomize

case $1 in
deploy)
  kp image create {{microserviceOneName}}-image -n {{appName}}-ns \
        --tag goharbor.io/{{appName}}/{{microserviceOneName}}:0.0.1 \
        --git https://github.com/myuser/{{microserviceOneName}}" \
        --git-revision main \
	--builder {{appName}}-builder \
        --wait
  kp image create {{microserviceTwoName}}-image -n {{appName}}-ns \
        --tag goharbor.io/{{appName}}/{{microserviceTwoName}}:0.0.1 \
        --git https://github.com/myuser/{{microserviceTwoName}}" \
        --git-revision main \
	--builder {{appName}}-builder \
        --wait
  kustomize build . | kubectl apply -f -
  ;;
patch)
  kp image patch {{microserviceOneName}}-image
  kp image patch {{microserviceTwoName}}-image
  kustomize build . | kubectl apply -f -
  ;;
delete)
  kustomize build . | kubectl delete -f -
  kp image delete {{microserviceOneName}}-image
  kp image delete {{microserviceTwoName}}-image
*)
  # incorrect usage
  ;;
esac
