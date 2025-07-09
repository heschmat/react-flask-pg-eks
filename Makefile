# Makefile

ENV_FILE := .env

.PHONY: help create-cluster delete-cluster

help:
	@echo "Usage:"
	@echo "  make create-cluster     # Create EKS cluster using ./k8s/create-cluster.sh"
	@echo "  make delete-cluster     # Delete EKS cluster using ./k8s/delete-cluster.sh"

create-cluster:
	@echo "📦 Creating EKS cluster..."
	@bash ./k8s/create-cluster.sh

delete-cluster:
	@echo "🗑️  Deleting EKS cluster..."
	@bash ./k8s/delete-cluster.sh
