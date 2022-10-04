resource "aws_api_gateway_rest_api" "example" {
  name = "example"
}

resource "aws_api_gateway_resource" "dog" {
    rest_api_id = aws_api_gateway_rest_api.example.id
    parent_id = aws_api_gateway_rest_api.example.root_resource_id
    path_part = "dog" 
}

resource "aws_api_gateway_method" "dog_get_method" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  resource_id = aws_api_gateway_resource.dog.id
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "dog_post"{
    rest_api_id = aws_api_gateway_rest_api.example.id
    resource_id = aws_api_gateway_resource.dog.id
    http_method = "POST"
    authorization = "NONE"
}