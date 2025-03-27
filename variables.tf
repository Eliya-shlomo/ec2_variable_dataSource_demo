variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"

  validation {
    condition     = contains(["us-east-1", "us-east-2"," us-west-1","us-west-2"], var.aws_region)
    error_message = "Unsupported AWS Region specified. Supported regions include: us-east-1, us-east-2, us-west-1, us-west-2."
  }
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "security_group" {
  description = "List of security group IDs"
  type        = list(string)
  default     = ["sg-24076", "sg-90890", "sg-456789"]
}
