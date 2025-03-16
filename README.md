# azure-function-terraform-template
A template repository to deploy an azure function using terraform and CI/CD

## Terraform folder structure
The terraform folder structure is meant to work with multiple environments, hence the inclusion of the terraform "environments" folder. The Github Actions env specific workflow is meant to work hand in hand with the respective terraform environment directory. Furthermore, Azure suggests that we should seperate environments per subscription. As part of the Github Actions workflow, we are passing the subscription id as a secret to select the respective Azure subscription.

Sidenote: If we desire to support multiple environments within the same subscription, it is advisable to generate separate Terraform state files for each environment. Additionally, establishing a resource group for each environment is required.

We can also consider the following folder structure given we want to centralize the terraform scripts into one repository:

```plaintext

tf/
│── modules/         # Reusable modules 
│   ├── networking/
│   ├── compute/
│   ├── storage/
│── environments/    # Separate environments & shared infra
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── backend.tf
│   │   ├── outputs.tf
│   ├── prod/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── backend.tf
│   │   ├── outputs.tf
│   ├── shared/      # Shared project/subscription for global resources
│   │   ├── main.tf  # Defines shared resources (e.g., artifact registry)
│   │   ├── variables.tf
│   │   ├── backend.tf
│   │   ├── outputs.tf
│── global/          # Shared configurations like IAM, VPC
│   ├── main.tf      # Calls networking.tf & security.tf modules
│   ├── networking.tf# Defines VPC, subnets, etc.
│   ├── security.tf  # Defines IAM roles, policies, etc.
│   ├── variables.tf # Variables for global resources
│   ├── outputs.tf   # Outputs for reference
│── services/        # Specific services using modules
│   ├── service-a/
│   ├── service-b/
│── terraform.tfvars # Global default variables (optional)
│── README.md        # Documentation


```
We can also re-use modules from our centralized repo by pushing the terraform modules onto azure blob storage and referring to them like below:

```Source modules example
module "vpc" {
  source = "https://mystorageaccount.blob.core.windows.net/terraform-modules/vpc-module.zip"

  # Example input variables
  region = "us-east-1"
  cidr   = "10.0.0.0/16"
}
