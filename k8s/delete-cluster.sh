#!/bin/bash
set -e

cd "$(dirname "$0")"

if [ ! -f ../.env ]; then
  echo "Missing ../.env file"
  exit 1
fi

export $(grep -v '^#' ../.env | xargs)

echo "Deleting EKS cluster: $CLUSTER_NAME in region $AWS_REGION"
eksctl delete cluster --name "$CLUSTER_NAME" --region "$AWS_REGION"
