---
title: "Using an existing resource in Terraform"
layout: post
date: 2022-05-20
projects: true
tag:

category: project
author: zacknovak
description:
---

# Overview

Sometimes, you don't want a resource deployed via Terraform to be destroyed. Other times, you can't destroy due to compliance reasons / you're limited by your AWS scope. In either case, you want to exclude resources from the destroy process. This isn't currently a built in feature of Terraform WHICH SUCKS. So you have to be a bit hacky. Here's how.

## Order of operations

In this example, I don't want to destroy an AWS log group and want to use an existing one. So I import it before the apply, and then remove it from the state file before I destroy.

1. `terraform init`
2. `terraform import aws_cloudwatch_log_group.lambda /aws/lambda/data-test-lambda`
3. `terraform plan`
4. `terraform apply --auto-approve`
5. `terraform state list`
6. `terraform state rm aws_cloudwatch_log_group.lambda`
7. `terraform destroy -auto-approve`

## Example main.tf

```terraform
provider "aws" {
  region  = "your_region"
  profile = "your_aws_profile"
}

module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = ">= 3.1.1"

  function_name                     = "data-test-lambda"
  description                       = "My awesome lambda function"
  handler                           = "lambda_handler"
  runtime                           = "python3.8"
  publish                           = true
  ephemeral_storage_size            = null
  source_path                       = "lambda_function.py"
  tracing_mode                      = "Active"
  store_on_s3                       = true
  s3_bucket                         = "your_s3_bucket"
  depends_on                        = [aws_cloudwatch_log_group.lambda]
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
  source                            = "terraform-aws-modules/lambda/aws"
  version                           = ">= 3.1.1"
  create_layer                      = true
  layer_name                        = "my-lambda-python-layer"
  description                       = "my python code"
  compatible_runtimes               = ["python3.8"]
  source_path                       = "lambda_function.py"
  store_on_s3                       = true
  s3_bucket                         = "your_s3_bucket"
  depends_on                        = [aws_cloudwatch_log_group.lambda]
  use_existing_cloudwatch_log_group = true
}

#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "lambda" {
  name = "/aws/lambda/existing-log-group"
}
```

## Lambda function

```python
import logging
import os

import boto3
import jsonpickle

logger = logging.getLogger()
logger.setLevel(logging.INFO)

client = boto3.client("lambda")
client.get_account_settings()


def lambda_handler(event, context):
    logger.info("## ENVIRONMENT VARIABLES\r" + jsonpickle.encode(dict(**os.environ)))
    logger.info("## EVENT\r" + jsonpickle.encode(event))
    logger.info("## CONTEXT\r" + jsonpickle.encode(context))
    response = client.get_account_settings()
    return response["AccountUsage"]
```

## Notes on this

-   GitHub issue with the recommendation: https://github.com/hashicorp/terraform/issues/23547
-   StackOverflow issue with the fix more or less: https://stackoverflow.com/questions/55265203/terraform-delete-all-resources-except-one
