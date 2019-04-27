#!/bin/sh

# index.html
kubectl create configmap --save-config indexhtml-config --from-file=./index.html

# config
kubectl create configmap --save-config jmx-config --from-file=./performance-test-scenario.jmx

# slave
slave_total=`cat slave_total`
for i in `seq $slave_total`
do
    export SLAVE_NUM=$i
    envsubst < slave.yaml | kubectl apply -f -
done

# master
sleep 10 
export SLAVE_SERVER_LIST=`kubectl get svc | grep -E '^jmeter-slave' | awk '{print $1}' | tr '\n' ',' | sed -e 's/,$//'`
envsubst < master.yaml | kubectl apply -f -
