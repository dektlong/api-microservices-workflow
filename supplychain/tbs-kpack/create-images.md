create TBS images

```
kp image create workload1 -n app-name \
  --tag registry/app-name/workload1:0.0.1 \
  --git git1 \
  --git-revision main \
  --builder app-name-builder \
  --wait
  
kp image create workload2 -n app-name \
  --tag registry/app-name/workload2:0.0.1 \
  --git git2\
  --git-revision main \
  --builder app-name-builder \
  --wait  
```

patch TBS images

```
kp image patch workload1

kp image patch workload2
```
