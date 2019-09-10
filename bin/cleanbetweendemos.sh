#!/usr/bin/env bash


DIR=~/code/wtdl
ME=cw

echo "...deleting any files created during a demo run"
rm -f ~/.wovtools
rm -Rf ~/.wovtools_secrets
rm -Rf node_modules
rm -f yarn.lock
rm -Rf ${DIR}/wovtools
rm -f ${DIR}/src/wtdlconfig.sh

rm -Rf ${DIR}_test.git
rm -Rf ${DIR}_dba.git
rm -Rf ${DIR}_secrets.git

mkdir ${DIR}_test.git
git -C ${DIR}_test.git init --bare

mkdir ${DIR}_secrets.git
git -C ${DIR}_secrets.git init --bare

mkdir ${DIR}_dba.git
git -C ${DIR}_dba.git init --bare


echo "...change this remote to local repo"
git remote set-url origin ${DIR}_test.git

# Change it back with
# git remote set-url origin git@github.com:woveon/wtdl.git

echo "...delete any Kubernetes namespaces or context created during a demo"
kubectl delete namespace wtd-${ME}   2> /dev/null
kubectl delete namespace wtd-dev   2> /dev/null
kubectl delete context wov-aws-va-grape-wtd-${ME}   2> /dev/null
kubectl delete context wov-aws-va-grape-wtd-dev   2> /dev/null

echo "...delete any AWS ECR container repos"
aws ecr delete-repository --force --repository-name wtd/wtdl
