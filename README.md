# Terraform AWS Auto Scaling Group

This repository contains Terraform configurations for setting up an AWS Auto Scaling Group using modules for better organization and reusability. The project includes a launch configuration, an auto-scaling group, auto-scaling policies, and CloudWatch alarms.

## Project Structure

├── main.tf
├── variables.tf
├── modules
│ ├── launch_configuration
│ │ ├── main.tf
│ │ └── variables.tf
│ ├── autoscaling_group
│ │ ├── main.tf
│ │ └── variables.tf
│ ├── autoscaling_policies
│ │ ├── main.tf
│ │ └── variables.tf
│ └── cloudwatch_alarms
│ ├── main.tf
│ └── variables.tf


## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) 0.12 or later
- AWS account
- AWS CLI configured with your credentials

## Getting Started

### Clone the repository

```sh
git clone https://github.com/yourusername/terraform-aws-autoscaling.git
cd terraform-aws-autoscaling

## Initialize Terraform
Initialize the Terraform working directory by running the following command:

## Plan and Apply
Review the Terraform execution plan with the terraform plan command, and then apply it with the terraform apply command:

## terraform plan
terraform apply

## Clean Up
To destroy the resources created by this configuration, run:
terraform destroy
