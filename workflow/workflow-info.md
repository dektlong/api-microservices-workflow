info on how to deploy app components, gateways and routes using Tanzu Build Service, Spring Cloud Gateway and Kustomize

deploy
```
kp image create {{subpath1}} -n {{app-name}} \
  --tag goharbor.io/{{app-name}}/{{subpath1}}:0.0.1 \
  --git {{parent-git}} \
  --sub-path ./{{subpath1}} \
  --git-revision main \
  --builder {{app-name}}-builder \
  --wait
  
kp image create {{subpath2}} -n {{app-name}} \
  --tag goharbor.io/{{app-name}}/{{subpath2}}:0.0.1 \
  --git {{parent-git}} \
  --sub-path ./{{subpath2}} \
  --git-revision main \
  --builder {{app-name}}-builder \
  --wait
  
kustomize build api-grid | kubectl apply -f -
```

patch
```
kp image patch {{subpath1}}

kp image patch {{subpath2}}
  
kustomize build api-grid | kubectl apply -f -
```

delete
```
kustomize build api-grid | kubectl delete -f -
  
kp image delete {{subpath1}}
  
kp image delete {{subpath2}}
```
