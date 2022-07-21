#!/bin/bash
set -eux

version="$(cat zookeeper_bosh_release_version/version)"

cd  zookeeper_bosh_release/

git config --global user.name "Concourse CI Bot"
git config --global user.email "ci@localhost"

RELEASE_YML=$PWD/releases/zookeeper/zookeeper-${version}.yml

# be idempotent
if ! [ -e "${RELEASE_YML}" ]; then
  echo "creating final release"
  bosh finalize-release ../zookeeper_bosh_candidate_release_s3/zookeeper-*.tgz \
    --version "$version"

  bosh create-release "${RELEASE_YML}" \
    --tarball "../release_tarball/zookeeper-$version.tgz"

  git add -A
  git commit -m "final release v${version}"
fi

cd ../

git clone zookeeper_bosh_release updated_zookeeper_bosh_release