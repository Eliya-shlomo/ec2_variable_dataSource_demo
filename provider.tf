provider "aws"{
  access_key = "${AWS_ACCESS_KEY}"
  secret_key = "${AWS_SECRET_KEY}"
  region     = "${var.AWS_REGION}"
}