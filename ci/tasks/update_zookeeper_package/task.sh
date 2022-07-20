#!/bin/bash

set -euox
# download the apache zookeeper release. Currently this is hardcoded.
#wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz


wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz

tar -xzvf zookeeper-3.4.10.tar.gz
mv zookeeper-3.4.10 zookeeper
tar -cvzf zookeeper.tar.gz zookeeper
mv zookeeper.tar.gz zookeeper_package/zookeeper.tar.gz