Create kNative service

```
kn service create workload3 \
        --image $PRIVATE_REGISTRY_URL/$PRIVATE_REGISTRY_APP_REPO/adopter-check:0.0.1 \
        --env REV="1.0" \
        --revision-name adopter-check-v1 \
        --namespace $APP_NAMESPACE
```
