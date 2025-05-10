provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "mediametrics-cluster"
  cluster_version = "1.28"
  subnets         = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
  vpc_id          = "vpc-zzzzzzzz"

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
    }
  }
}
