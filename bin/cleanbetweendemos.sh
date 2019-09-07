#!/usr/bin/env bash


DIR=~/code/wtdl
ME=cw

rm ~/.wovtools
rm -Rf ~/.wovtools_secrets
rm -Rf ${DIR}/wovtools
rm ${DIR}/src/wtdlconfig.sh

rm -Rf ${DIR}_test.git
rm -Rf ${DIR}_dba.git
rm -Rf ${DIR}_secrets.git

mkdir ${DIR}_test.git
git -C ${DIR}_test.git init --bare

mkdir ${DIR}_secrets.git
git -C ${DIR}_secrets.git init --bare

mkdir ${DIR}_dba.git
git -C ${DIR}_dba.git init --bare


# change this remote to local repo
git remote set-url origin ${DIR}_test.git

# Change it back with
# git remote set-url origin git@github.com:woveon/wtdl.git

kubectl delete namespace wtd-${ME}
kubectl delete namespace wtd-dev
kubectl delete context wov-aws-va-grape-wtd-${ME}
kubectl delete context wov-aws-va-grape-wtd-dev
