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
7. `terraform destroy -auto-approve`s

## Example main.tf

![main.tf](https://github.com/Novak478/novak478.github.io/blob/master/assets/terraform/example_tf_exclude_resource.tf#L1-53)

## Lambda function

![Lambda](https://github.com/Novak478/novak478.github.io/blob/master/assets/python/example_lambda_function.py#L1-20)

## Notes on this

-   GitHub issue with the recommendation: https://github.com/hashicorp/terraform/issues/23547
-   StackOverflow issue with the fix more or less: https://stackoverflow.com/questions/55265203/terraform-delete-all-resources-except-one
