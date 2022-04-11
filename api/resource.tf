resource "aws_api_gateway_resource" "api" {
  path_part   = "resource"
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "get" {
  path_part   = "{id}"
  parent_id   = aws_api_gateway_resource.api.id
  rest_api_id = aws_api_gateway_rest_api.main.id
}

