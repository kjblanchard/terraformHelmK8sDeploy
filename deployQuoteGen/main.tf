provider "aws" {
  region = "us-east-2"
}

#Use our module in the modules folder to build this, and set all the input variables to below.
module "webserver_cluster" {
  source = "../modules/deployments"
  image_id = "enf3rno/testquotegen:test"
  min_replicas = 2
  max_replicas = 10
  cpu_scale_threshold = 1
  deploymentName = "quotegen"
  websiteDnsName = "kubernetes"
  enable_r53 = true
}