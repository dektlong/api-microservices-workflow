Create an image builder for the app-name project

```
kp builder create app-name-builder -n app-name-ns \
  --tag registry/app-name/app-name-builder \
  --order build-order.yaml \
  --stack base \
  --store default
```
