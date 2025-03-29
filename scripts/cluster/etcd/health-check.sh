#! /bin/bash

######Health Check######

#Check member list
etcdctl member list \
  --endpoints=https://etcd-01:2379 \
  --cacert=/etc/etcd/ca.pem \
  --cert=/etc/etcd/etcd.pem \
  --key=/etc/etcd/etcd-key.pem \
  -w table

#Node health check
ETCDCTL_API=3 etcdctl \
  --endpoints=https://etcd-01:2379,https://etcd-02:2379,https://etcd-03:2379 \
  --cacert=/etc/etcd/ca.pem \
  --cert=/etc/etcd/etcd.pem \
  --key=/etc/etcd/etcd-key.pem \
  endpoint health --write-out=table

#Cluster status check
ETCDCTL_API=3 etcdctl \
  --endpoints=https://etcd-01:2379,https://etcd-02:2379,https://etcd-03:2379 \
  --cacert=/etc/etcd/ca.pem \
  --cert=/etc/etcd/etcd.pem \
  --key=/etc/etcd/etcd-key.pem \
  endpoint status --write-out=table
