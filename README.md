# azure-function-terraform-template
A template repository to deploy an azure function using terraform and CI/CD

## Terraform folder structure
The terraform folder structure is meant to work with multiple environments, hence the inclusion of the terraform "environments" folder. The Github Actions env specific workflow is meant to work hand in hand with the respective terraform environment directory. Furthermore, Azure suggests that we should seperate environments per subscription. As part of the Github Actions workflow, we are passing the subscription id as a secret to select the respective Azure subscription.

Sidenote: If we desire to support multiple environments within the same subscription, it is advisable to generate separate Terraform state files for each environment. Additionally, establishing a resource group for each environment is required.

We can also consider the following folder structure given we want to centralize the terraform scripts into one repository:

```plaintext
/terraform
  ├── /shared
  │     └── /dev
  │     ├── /prod
  ├── /modules
  │     ├── /vpc
  │     ├── /db
  │     └── /iam
  ├── /services
  │     ├── /service-a
  │     │     ├── /dev
  │     │     └── /prod
  │     ├── /service-b
  │     │     ├── /dev
  │     │     └── /prod
```
We can also re-use modules from our centralized repo by pushing the terraform modules onto azure blob storage and referring to them like below:

```Source modules example
module "vpc" {
  source = "https://mystorageaccount.blob.core.windows.net/terraform-modules/vpc-module.zip"

  # Example input variables
  region = "us-east-1"
  cidr   = "10.0.0.0/16"
}
