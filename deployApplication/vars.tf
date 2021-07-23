variable "image_id" {
  type        = string
  description = "The image and tag that should be used when building the image."
}

data "terraform_remote_state" "eks" {  
  backend = "local"
  config = {    
    path = "../terraform.tfstate"  
  }
}
