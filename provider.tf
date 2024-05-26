terraform {
  required_version = ">= 1.6.0"
  backend "s3" {
    bucket = "opentofu-aws-waf-example"
    key    = "ci-codebuild.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = local.region
}