#!/bin/bash
set -eux

version="$(cat zookeeper_bosh_release_version/version)"
cd zookeeper_bosh_release

bosh create-release --force \
  --version "$version" \
  --tarball "../release_tarball/zookeepeer-$version.tgz"