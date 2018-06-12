## Introduction

The project here is to act a test harness for modules. It creates a VPC as defined in the `vpc.tf` file. It uses the [terraform-aws-vpc
](https://github.com/terraform-aws-modules/terraform-aws-vpc) module. Feel free to modify to suit your needs.

The idea is that you create a `test.td` file where you include your own module so that you can test in isolation what is being done.

Simples :)