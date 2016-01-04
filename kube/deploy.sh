#!/bin/bash -x
set -e

REPO={{ project_name }}

docker build -t $REPO .
docker tag $REPO lucemia/$REPO
docker push lucemia/$REPO

wget https://storage.googleapis.com/kubernetes-release/release/v1.0.1/bin/linux/amd64/kubectl
chmod +x kubectl
sudo cp kubectl /usr/local/bin/kubectl

source kube/deploy.sh
