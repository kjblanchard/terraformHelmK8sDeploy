terraform {
  backend "s3" {
    bucket         = data.terraform_remote_state.eks.outputs.deployment_bucket
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"    
    dynamodb_table = data.terraform_remote_state.eks.outputs.deployment_locks
    encrypt        = true
  }
}