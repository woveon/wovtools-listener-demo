

# Executive Summary

This is a simple demo of WovTools that I used to create the videos. There are a few external commands you need to run to set up your ops, but otherwise, this shows the simplicity of WovTools to turn a bit of code into a microservice in a Kubernetes cluster.

# Ops

- You need a few git repositories first. I created these locally to my filesystem to speed the demo. You will want to create these on a server like Github (for non-sensitive data) or a Cloud Provider.
```
# This makes local git repos for the secrets and database
mkdir ~/code/wovtools-listener-demo_secrets.git
git -C ~/code/wovtools-listener-demo_secrets.git init --bare
mkdir ~/code/wovtools-listener-demo_dba.git
git -C ~/code/wovtools-listener-demo_dba.git init --bare
```

# Commands Used

- `wov-init`
