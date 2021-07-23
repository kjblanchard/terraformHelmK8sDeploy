provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../modules/deployments"
  image_id = "enf3rno/testquotegen:test"
  min_replicas = 2
  max_replicas = 10
  cpu_scale_threshold = 1
  deploymentName = "quotegen"
}