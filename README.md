# AWS Serverless REST API

This project uses Terraform to configure and deploy a REST API using AWS Gateway and AWS Lambda to serve the endpoints.

The lambda handlers are defined in `lambda/handlers/http_methods.py`, these methods correspond to the methods associated with the methods on the API resources. Below is a table with the endpoints and associated lambda functions, skeleton methods are defined in `/lambda/handlers/http_methods.py` with no implementation.

The response from the lambda method should use the format provided by `Response.format` class method.

| ROUTE                    | METHOD | HANDLER             |
| ------------------------ | ------ | ------------------- |
| `/post`                  | GET    | http_methods.list   |
| `/post`                  | POST   | http_methods.post   |
| `/post/<string:post_id>` | GET    | http_methods.get    |
| `/post/<string:post_id>` | PUT    | http_methods.put    |
| `/post/<string:post_id>` | DELETE | http_methods.delete |

## Cloud Diagram

![alt Cloud Diagram](https://github.com/subaquatic-pierre/serverless-api/blob/main/assets/cloud-diagram.png?raw=true))

## Requirements

- Terraform v1.1.8
- Terraform - provider registry.terraform.io/hashicorp/aws v4.0.0

## How To

- Clone the repo
- Update `/lambda/handlers/http_methods.py` with your lambda implementations
- Update `terrafrom.tfvars.example` with your credentials
- Rename `terrafrom.tfvars.example` to `terraform.tfvars`
- Run
  `terraform plan -out plan`
- Run
  `terraform apply`
