#!/bin/bash

echo "Loading ENV vars"
. ./env.sh

echo "Creating Azure connection"
az login --service-principal -u $AZ_APPID -p $AZ_SECRET --tenant $AZ_TENANTID