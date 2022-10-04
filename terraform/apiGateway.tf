resource "aws_api_gateway_rest_api" "example" {
  name = "example"
}

resource "aws_api_gateway_resource" "dog" {
    rest_api_id = aws_api_gateway_rest_api.example.id
    path_part = "dog" 
}

resource "aws_api_gateway_method" "dog_get_method" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  resource_id = aws_api_gateway_resource.dog
  http_method = "GET"
  authorization = "NONE"
}