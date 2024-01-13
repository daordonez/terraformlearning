#!/bin/bash

echo "Loading ENV vars"
. ./env.sh

#Terraform init - add providers
echo "Initializing Terraform providers"
terraform init

#Terraform plan - This action will save out plan in a file
echo "Saving Terraform plan into 'lab01plan.tfplan'"
terraform plan -out ./lab01plan.tfplan

#Terraform apply - Applying deployment
echo "Launching Terraform deployment - Azure"
terraform apply -auto-approve