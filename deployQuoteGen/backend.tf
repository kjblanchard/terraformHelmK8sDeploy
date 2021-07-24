terraform {
  backend "s3" {
    bucket         = "quotegen-supergoon-kjb"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"    
    dynamodb_table = "quotegen-locks"
    encrypt        = true
  }
}