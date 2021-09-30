Create kNative service

```
kn service create workload3 -n app-name\
        --image registry/app-name/workload3:0.0.1 \
        --env REV="1.0" \
        --revision-name workload3-v1 \
```
