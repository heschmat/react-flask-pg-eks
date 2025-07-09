#!/bin/bash
set -e

# Go to the script's directory
cd "$(dirname "$0")"

# Load environment variables from parent directory
if [ ! -f ../.env ]; then
  echo "Missing ../.env file"
  exit 1
fi

# Export all non-comment lines as env vars
export $(grep -v '^#' ../.env | xargs)

# Render the template
envsubst < cluster.yaml.template > cluster.yaml

echo "Rendered cluster.yaml:"
cat cluster.yaml

# Create the cluster
echo "Creating EKS cluster: $CLUSTER_NAME in region $AWS_REGION"
eksctl create cluster -f cluster.yaml

rm cluster.yaml
