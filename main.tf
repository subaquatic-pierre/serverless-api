terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }

  required_version = "~> 1.0"
}

provider "aws" {
  region = "us-east-1"
}


module "lambda" {
  source            = "./lambda"
  api_execution_arn = module.api.api_execution_arn
}


module "api" {
  source              = "./api"
  domain_name         = var.domain_name
  tags                = var.tags

  # lambda invoke arns
  lambda_index_invoke_arn   = module.lambda.lambda_index_invoke_arn
  lambda_list_invoke_arn   = module.lambda.lambda_list_invoke_arn
  lambda_get_invoke_arn    = module.lambda.lambda_get_invoke_arn
  lambda_put_invoke_arn    = module.lambda.lambda_put_invoke_arn
  lambda_post_invoke_arn   = module.lambda.lambda_post_invoke_arn
  lambda_delete_invoke_arn = module.lambda.lambda_delete_invoke_arn
  deployed_at              = timestamp()
}

module "cors_main" {
  source  = "mewa/apigateway-cors/aws"
  version = "2.0.1"

  api      = module.api.aws_api_gateway_rest_api_id
  resource = module.api.aws_api_gateway_resource_main_id

  methods = ["GET", "POST"]
}

module "cors_api" {
  source  = "mewa/apigateway-cors/aws"
  version = "2.0.1"

  api      = module.api.aws_api_gateway_rest_api_id
  resource = module.api.aws_api_gateway_resource_api_id

  methods = ["GET", "POST", "PUT", "DELETE"]
}
