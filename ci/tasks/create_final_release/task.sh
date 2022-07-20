#!/bin/bash
set -eux

version="$(cat zookeepeer_bosh_release_version/version)"

cat $version
exit 1

cd  zookeepeer_bosh_release/

git config --global user.name "Concourse CI Bot"
git config --global user.email "ci@localhost"

RELEASE_YML=$PWD/releases/zookeepeer/zookeepeer-${version}.yml

# be idempotent
if ! [ -e "${RELEASE_YML}" ]; then
  echo "creating final release"
  bosh finalize-release ../zookeepeer_bosh_candidate_release_s3/zookeepeer-*.tgz \
    --version "$version"

  bosh create-release "${RELEASE_YML}" \
    --tarball "../release_tarball/zookeepeer-$version.tgz"

  git add -A
  git commit -m "final release v${version}"
fi

cd ../

git clone zookeepeer_bosh_release updated_zookeepeer_bosh_release