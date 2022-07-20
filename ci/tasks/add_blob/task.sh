#!/bin/bash

set -euox

git config --global user.name "Concourse CI Bot"
git config --global user.email "ci@localhost"

cd zookeepeer_bosh_release
  bosh -n add-blob ../blob_dir/$BLOB_FILE $BLOB_PATH
  bosh -n upload-blobs

  git add config/blobs.yml
  git commit -m "Update $BLOB_PATH blob"
cd ../

git clone zookeepeer_bosh_release updated_zookeepeer_bosh_release