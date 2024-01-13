#!/bin/bash

echo "Loading ENV vars"
. ./env.sh

#echo "Creating Azure connection"
#az login --service-principal -u $AZ_APPID -p $AZ_SECRET --tenant $AZ_TENANTID


#Terraform init - add providers
echo "Initializing Terraform providers"
terraform init

#Terraform plan - This action will save out plan in a file
echo "Saving Terraform plan into 'lab01plan.tfplan'"
terraform plan -out ./lab01plan.tfplan

#Terraform apply - Applying deployment
echo "Launching Terraform deployment - Azure"
terraform apply -auto-approve