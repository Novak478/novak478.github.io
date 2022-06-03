provider "aws" {
  region   = "your_region"
  profile  = "your_aws_profile"
}

module "lambda_function" {
  source                 = "terraform-aws-modules/lambda/aws"
  version                = ">= 3.1.1"

  function_name          = "data-test-lambda"
  description            = "My awesome lambda function"
  handler                = "lambda_handler"
  runtime                = "python3.8"
  publish                = true
  ephemeral_storage_size = null
  source_path            = "lambda_function.py"
  tracing_mode           = "Active"
  store_on_s3            = true
  s3_bucket              = "your_s3_bucket"
  depends_on             = [aws_cloudwatch_log_group.lambda]
  use_existing_cloudwatch_log_group = true

  layers = [
    module.lambda_layer_s3.lambda_layer_arn,
  ]

  environment_variables = {
    myenv = "myval"
  }

  tags = {
    Module = "mymodule"
  }
}

module "lambda_layer_s3" {
  source              = "terraform-aws-modules/lambda/aws"
  version             = ">= 3.1.1"
  create_layer        = true
  layer_name          = "my-lambda-python-layer"
  description         = "my python code"
  compatible_runtimes = ["python3.8"]
  source_path         = "lambda_function.py"
  store_on_s3         = true
  s3_bucket           = "your_s3_bucket"
  depends_on          = [aws_cloudwatch_log_group.lambda]
  use_existing_cloudwatch_log_group = true
}

#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "lambda" {
  name    = "/aws/lambda/existing-log-group"
}