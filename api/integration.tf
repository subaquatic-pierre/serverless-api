resource "aws_api_gateway_integration" "index" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_rest_api.main.root_resource_id
  http_method             = aws_api_gateway_method.index.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_index_invoke_arn
}

resource "aws_api_gateway_integration" "list" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.api.id
  http_method             = aws_api_gateway_method.list.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_list_invoke_arn
}

resource "aws_api_gateway_integration" "post" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.api.id
  http_method             = aws_api_gateway_method.post.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_post_invoke_arn
}

resource "aws_api_gateway_integration" "get" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.get.id
  http_method             = aws_api_gateway_method.get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_get_invoke_arn
}

resource "aws_api_gateway_integration" "put" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.get.id
  http_method             = aws_api_gateway_method.put.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_put_invoke_arn
}

resource "aws_api_gateway_integration" "delete" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.get.id
  http_method             = aws_api_gateway_method.delete.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_delete_invoke_arn
}

