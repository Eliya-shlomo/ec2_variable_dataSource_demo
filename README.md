# EC2 Deployment with Terraform: Variables & Data Sources

This project automates the provisioning of AWS EC2 infrastructure using Terraform, emphasizing modularity, scalability, and best practices such as state management via S3 backend, utilization of variables and data sources, secure access configurations, and service bootstrapping.

## 🔧 Stack

- **Terraform v1.x**
- **AWS EC2 (Ubuntu 20.04 AMI)**
- **S3 (remote state backend)**
- **Security Group with ingress rules (HTTPS)**
- **User data script for Nginx installation**

---

## 📁 Project Structure

```bash
.
├── backend.tf               # S3 remote state backend configuration
├── provider.tf              # AWS provider declaration
├── variables.tf             # Input variables
├── outputs.tf               # Resource outputs (e.g., public IP)
├── createinstance.tf        # EC2 instance provisioning logic
├── securitygroup.tf         # Custom security group with dynamic IPs
├── installNginx.sh          # User data script for post-launch configuration
├── terraform.tfstate        # (local state fallback)
├── .terraform.lock.hcl      # Dependency lockfile
├── .gitignore
└── README.md


terraform init -reconfigure      # Backend initialization
terraform plan                   # Execution plan preview
terraform apply                  # Infrastructure provisioning


## 🔒 Access & Credentials

export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...


## 📌 Notes

* Security Group Rules: The setup dynamically generates ingress rules based on regional IP ranges. If the number of rules exceeds AWS limits, consider splitting them across multiple security groups or utilizing prefix lists.

