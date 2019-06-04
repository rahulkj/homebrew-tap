#!/bin/bash -e

REPO_OM=pivotal-cf/om
REPO_CONCOURSE=concourse/concourse
REPO_CRED_ALERT=pivotal-cf/cred-alert

get_latest_release() {
    OUTPUT=$(curl --silent "https://api.github.com/repos/$1/releases/latest")
    DOWNLOAD_URL=$(echo "$OUTPUT" | \
      jq -r \
      --arg flavor $2 '.assets[] | select(.name | contains($flavor)) | .browser_download_url')
    LATEST_TAG=$(echo "$OUTPUT" | jq '.tag_name')
    echo $DOWNLOAD_URL
    echo $LATEST_TAG
}

fly() {
    get_latest_release "$REPO_CONCOURSE" "darwin-amd64"

    while read -r line; do
      if [[ "$line" == *fly-*darwin-amd64.tgz ]]; then
        wget -qO fly.tgz "$line"
        SHA=$(shasum -a 256 fly.tgz | cut -d ' ' -f1)
        VERSION=$(echo "$LATEST_TAG" | tr -d 'v')

        sed -i "s/version  \".*\"/version  $VERSION/ ;s/sha256.*/sha256   \"$SHA\"/" $PWD/../fly.rb

        rm fly.tgz
      fi
    done <<< "$DOWNLOAD_URL"
}

concourse() {
    get_latest_release "$REPO_CONCOURSE" "darwin-amd64"

    while read -r line; do
      if [[ "$line" == *concourse-*darwin-amd64.tgz ]]; then
        wget -qO concourse.tgz "$line"
        SHA=$(shasum -a 256 concourse.tgz | cut -d ' ' -f1)
        VERSION=$(echo "$LATEST_TAG" | tr -d 'v')

        sed -i "s/version  \".*\"/version  $VERSION/ ;s/sha256.*/sha256   \"$SHA\"/" $PWD/../concourse.rb

        rm concourse.tgz
      fi
    done <<< "$DOWNLOAD_URL"
}

om() {
    get_latest_release "$REPO_OM" "darwin"

    wget -qO om "$DOWNLOAD_URL"
    SHA=$(shasum -a 256 om | cut -d ' ' -f1)
    VERSION=$(echo "$LATEST_TAG" | tr -d 'v')

    sed -i "s/version  \".*\"/version  $VERSION/ ;s/sha256.*/sha256   \"$SHA\"/" $PWD/../om.rb

    rm om
}

cred-alert() {
  get_latest_release "$REPO_CRED_ALERT" "linux"

  wget -qO cred-alert "$DOWNLOAD_URL"
  SHA=$(shasum -a 256 cred-alert | cut -d ' ' -f1)
  VERSION=$(echo "$LATEST_TAG" | tr -d 'v')

  sed -i "s/version  \".*\"/version  $VERSION/ ;s/sha256.*/sha256   \"$SHA\"/" $PWD/../cred-alert.rb

  rm cred-alert
}

git-commit-push() {
  cd ..
  git config --global user.email "ci@homelab.io"
  git config --global user.name "CI Bot"
  git add . && git commit -m "Updated formulas" && git push
}

fly
concourse
om
cred-alert
git-commit-push
