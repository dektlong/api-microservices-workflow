create TBS images

```
kp image create myapp -n myapp-ns \
  --tag myregistry.example.com/myrepo/myapp:0.0.1 \
  --git mygit \
  --git-revision main \
  --builder myapp-builder \
  --wait 
```
