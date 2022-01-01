Create an image builder for the app-name project

```
kp builder create myapp-builder -n myapp-ns \
  --tag myregistry.example.com/myrepo/myapp-builder \
  --order build-order.yaml \
  --stack base \
  --store default
```
