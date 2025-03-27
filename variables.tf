variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIATZVXLVNCOHACXB64"
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "AWS_REGION" {
  type = string
  default = "us-east-2"


  validation {
    condition = contains(["es-east-2",lower(var.AWS_REGION)])
    error_message = "Unsupported AWS Region specified. Supported regions includes:${var.AWS_REGION}"
  }
}

