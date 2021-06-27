#!/usr/bin/env bash

kp builder create app-name-builder -n app-name-ns \
   --tag goharbor.io/app-name/app-name-builder \
   --order build-order.yaml \
   --stack base \
   --store default
