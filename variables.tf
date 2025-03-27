variable "AWS_REGION" {
  type = string
  default = "us-east-2"

  ## To Valid the chosen region is under the right instructions
  validation {
    condition = contains(["es-east-2",lower(var.AWS_REGION)])
    error_message = "Unsupported AWS Region specified. Supported regions includes:${var.AWS_REGION}"
  }
}


variable "Security_Group" {
  type = "list"
  default = ["sg-24076", "sg-90890", "sg-456789"]
}









