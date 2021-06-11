#!/usr/bin/env bash

kp builder create {{appName}}-builder -n {{appName}}-ns \
   --tag goharbor.io/{{appName}}/{{appName}}-builder \
   --order build-order.yaml \
   --stack base \
   --store default
