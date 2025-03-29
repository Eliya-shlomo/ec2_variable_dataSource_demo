terraform {
  backend "s3" {
    bucket = "tf-state-projects-junior"
    key = "development/terraform_state"
    region = "us-east-1"
  }
}