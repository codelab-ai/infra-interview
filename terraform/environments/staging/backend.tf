terraform {
  backend "s3" {
    bucket = "codelab-terraform-backend-store"
    key    = "aws/env/staging/tf.state"
    region = "us-west-1"
  }
}
