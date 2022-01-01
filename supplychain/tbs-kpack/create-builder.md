Create an image builder for the app-name project

```
kp builder create myapp-builder -n myapp-ns \
  --tag example.com/myregistry/myrepo/myapp-builder \
  --order build-order.yaml \
  --stack base \
  --store default
```
