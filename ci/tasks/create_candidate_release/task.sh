#!/bin/bash
set -eux

version="$(cat zookeepeer_bosh_release_version/version)"
cd zookeepeer_bosh_release

bosh create-release --force \
  --version "$version" \
  --tarball "../release_tarball/zookeepeer-$version.tgz"