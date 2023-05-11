#!/bin/bash

LITMUSCTL_VERSION="0.19.0"

LITMUS_ENDPOINT=""
LITMUS_USERNAME=""
LITMUS_PASSWORD=""


curl "https://litmusctl-production-bucket.s3.amazonaws.com/litmusctl-linux-amd64-$LITMUSCTL_VERSION.tar.gz" -o litmusctl.tar.gz
tar -zxvf litmusctl.tar.gz
chmod +x litmusctl
sudo mv litmusctl /usr/local/bin/litmusctl
rm litmusctl.tar.gz

litmusctl config set-account --endpoint="$LITMUS_ENDPOINT" --username="$LITMUS_USERNAME" --password="$LITMUS_PASSWORD"
