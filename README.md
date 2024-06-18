# Terraform AWS ECS Cluster with ALB

This Terraform project sets up an AWS ECS (Elastic Container Service) cluster integrated with an ALB (Application Load Balancer) to deploy containerized applications. It automates the creation of necessary resources such as VPC, subnets, security groups, ECS cluster, ECS service, ALB, and related configurations using Infrastructure-as-Code principles.

## Architecture Diagram

<p>
  <img src="https://github.com/mayaworld13/terraform-loadbalance-ECS/assets/127987256/27b6aebd-fd30-48f6-83d4-98b4f2173367" alt="AWS VPC Project Diagram" width="700" height="600" />
</p>


## Demo-video

https://github.com/mayaworld13/terraform-loadbalance-ECS/assets/127987256/6f7500d2-1360-45ed-a2e6-023c8615fe0e


## Prerequisites

Before you begin, ensure you have the following prerequisites:

- AWS account credentials configured with appropriate permissions.
- Terraform CLI installed locally. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).
- Basic understanding of AWS services, ECS, ALB, and Terraform concepts.

## Getting Started

To deploy the infrastructure using Terraform, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/mayaworld13/terraform-loadbalance-ECS.git
   cd terraform-loadbalance-ECS
   ```

2. **Initialize Terraform:**
    <br>
    Initialize Terraform in the project directory to download necessary providers and modules:

   ```bash
   terraform init
   ```

3. **Review and Customize Configuration:**
   <br>
   <br>
   Review the terraform.tfvars file and customize the variables as per your requirements. Ensure you provide valid AWS credentials, VPC settings, subnet IDs, ALB configuration, etc.

4. **To structure the look and feel of terraform files:**
   ```sh
   terraform fmt
   ```

5. **To validate the syntax:**
   ```sh
   terraform validate
   ```

6. **To plan what will be created after running this configeration:**
   ```sh
   terrform plan
   ```

7. **Apply the configuration to create the infrastructure:**
   ```sh
   terraform apply --auto-approve
   ```





