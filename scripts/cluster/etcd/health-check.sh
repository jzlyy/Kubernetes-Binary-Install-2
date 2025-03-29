#! /bin/bash

######Health Check######

#查看成员列表
etcdctl member list \
  --endpoints=https://etcd-01:2379 \
  --cacert=/etc/etcd/ca.pem \
  --cert=/etc/etcd/etcd.pem \
  --key=/etc/etcd/etcd-key.pem \
  -w table

#节点健康检测
ETCDCTL_API=3 etcdctl \
  --endpoints=https://etcd-01:2379,https://etcd-02:2379,https://etcd-03:2379 \
  --cacert=/etc/etcd/ca.pem \
  --cert=/etc/etcd/etcd.pem \
  --key=/etc/etcd/etcd-key.pem \
  endpoint health --write-out=table

#集群状态检测
ETCDCTL_API=3 etcdctl \
  --endpoints=https://etcd-01:2379,https://etcd-02:2379,https://etcd-03:2379 \
  --cacert=/etc/etcd/ca.pem \
  --cert=/etc/etcd/etcd.pem \
  --key=/etc/etcd/etcd-key.pem \
  endpoint status --write-out=table
