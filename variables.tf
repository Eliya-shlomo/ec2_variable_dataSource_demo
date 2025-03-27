variable "AWS_REGION" {
  type = string
  default = "us-east-2"

  ## To Valid the chosen region is under the right instructions
  validation {
    condition = contains(["es-east-2",lower(var.AWS_REGION)])
    error_message = "Unsupported AWS Region specified. Supported regions includes:${var.AWS_REGION}"
  }
}








