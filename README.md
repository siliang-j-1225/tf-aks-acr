# Introduction

Simple Terraform scripts to create an AKS cluster and ACR associated with the cluster.

# Prerequisite

## Terraform cli
Quick install for windows: 
```
choco install terraform
```  
Other ways please refer to [Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html).

## Azure Cli
Installation please refer to [Install the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)

After installation, login to azure:
```
az login
```
Please don't  check which subscription you are currently in, use the following command:
```
az account show 
```

If you want to change to another subscription:
```
az account list --output table
```
to list all subscriptions and switch with:
```
az account set --subscription <SubscriptionId>
```

# Run 

Check what resources will be deployed,
```
terraform plan
```
Deploy the resources,
```
terraform apply
```
# Clean

Destroy the resources,
```
terraform destroy
```

