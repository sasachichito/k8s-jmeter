#!/bin/sh

# config
kubectl delete configmap indexhtml-config

# config
kubectl delete configmap jmx-config

# slave
slave_total=`cat slave_total`
for i in `seq $slave_total`
do
    export SLAVE_NUM=$i
    envsubst < slave.yaml | kubectl delete -f -
done

# master
kubectl delete -f master.yaml
