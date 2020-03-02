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

    CURRENT_VERSION=$(cat $PWD/../fly.rb | grep version | head -1 | cut -d '"' -f2)

    while read -r line; do
      if [[ "$line" == *fly-*darwin-amd64.tgz ]]; then
        wget -qO fly.tgz "$line"
        SHA=$(shasum -a 256 fly.tgz | cut -d ' ' -f1)
        VERSION=$(echo "$LATEST_TAG" | tr -d 'v')

        NEW_VERSION=$(echo "$VERSION" | cut -d '"' -f2)
        IS_NEW=$(echo "$CURRENT_VERSION $NEW_VERSION" | awk '{print ($1 < $2)}')

        if (( $IS_NEW == 1 )); then
          sed -i "s/version  \".*\"/version  $VERSION/ ;s/sha256.*/sha256   \"$SHA\"/" $PWD/../fly.rb
        else
          echo "skipping updating the version"
        fi

        rm fly.tgz
      fi
    done <<< "$DOWNLOAD_URL"
}

concourse() {
    get_latest_release "$REPO_CONCOURSE" "darwin-amd64"

    CURRENT_VERSION=$(cat $PWD/../concourse.rb | grep version | head -1 | cut -d '"' -f2)

    while read -r line; do
      if [[ "$line" == *concourse-*darwin-amd64.tgz ]]; then
        wget -qO concourse.tgz "$line"
        SHA=$(shasum -a 256 concourse.tgz | cut -d ' ' -f1)

        VERSION=$(echo "$LATEST_TAG" | tr -d 'v')
        NEW_VERSION=$(echo "$VERSION" | cut -d '"' -f2)

        IS_NEW=$(echo "$CURRENT_VERSION $NEW_VERSION" | awk '{print ($1 < $2)}')

        if (( $IS_NEW == 1 )); then
          sed -i "s/version  \".*\"/version  $VERSION/ ;s/sha256.*/sha256   \"$SHA\"/" $PWD/../concourse.rb
        else
          echo "skipping updating the version"
        fi

        rm concourse.tgz
      fi
    done <<< "$DOWNLOAD_URL"
}

om() {
    get_latest_release "$REPO_OM" "darwin"

    CURRENT_VERSION=$(cat $PWD/../om.rb | grep version | head -1 | cut -d '"' -f2)

    while read -r line; do
      if [[ "$line" == *om-*darwin-*.tar.gz ]]; then
        wget -qO om.tgz "$line"
        SHA=$(shasum -a 256 om.tgz | cut -d ' ' -f1)
        VERSION=$(echo "$LATEST_TAG" | tr -d 'v')

        NEW_VERSION=$(echo "$VERSION" | cut -d '"' -f2)
        IS_NEW=$(echo "$CURRENT_VERSION $NEW_VERSION" | awk '{print ($1 < $2)}')

        if (( $IS_NEW == 1 )); then
          sed -i "s/version  \".*\"/version  $VERSION/ ;s/sha256.*/sha256   \"$SHA\"/" $PWD/../om.rb
        else
          echo "skipping updating the version"
        fi

        rm om.tgz
      fi
    done <<< "$DOWNLOAD_URL"
}

cred-alert() {
  get_latest_release "$REPO_CRED_ALERT" "darwin"

  CURRENT_VERSION=$(cat $PWD/../cred-alert.rb | grep version | head -1 | cut -d '"' -f2)

  wget -qO cred-alert "$DOWNLOAD_URL"
  SHA=$(shasum -a 256 cred-alert | cut -d ' ' -f1)
  VERSION=$(echo "$LATEST_TAG" | tr -d 'v')

  NEW_VERSION=$(echo "$VERSION" | cut -d '"' -f2)
  IS_NEW=$(echo "$CURRENT_VERSION $NEW_VERSION" | awk '{print ($1 < $2)}')

  if (( $IS_NEW == 1 )); then
    sed -i "s/version  \".*\"/version  $VERSION/ ;s/sha256.*/sha256   \"$SHA\"/" $PWD/../cred-alert.rb
  else
    echo "skipping updating the version"
  fi

  rm cred-alert
}

fly
concourse
om
cred-alert
