variable "image_id" {
  type        = string
  description = "The image and tag that should be used when building the image."
}
variable "min_replicas" {
  type        = number
  description = "The minimum amount of replicas for the HPA"
}
variable "max_replicas" {
  type        = number
  description = "The max amount of replicas for the HPA"
}
variable "cpu_scale_threshold" {
  type        = number
  description = "The cpu % that should trigger an autoscale of the HPA"
}
variable "deploymentName" {
  type        = string
  description = "The deployment name for this deployment, used for naming things properly"
}

data "terraform_remote_state" "eks" {  
  backend = "local"
  config = {    
    path = "../terraform.tfstate"  
  }
}
