#!/bin/bash

set -euox
# download the apache zookeeper release. Currently this is hardcoded.
wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz

mv apache-zookeeper-3.8.0-bin.tar.gz zookeeper_package/zookeeper.tar.gz