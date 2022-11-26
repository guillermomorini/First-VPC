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

resource "aws_api_gateway_method_response" "check_in_method_response" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  resource_id = aws_api_gateway_resource.dog.id
  http_method = aws_api_gateway_method.dog_get_method.http_method
  status_code = 200
}



resource "aws_api_gateway_rest_api" "http-crud-tutorial-api" {
  name = "http-crud-tutorial-api"
}

resource "aws_api_gateway_resource" "item" {
    rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
    parent_id = aws_api_gateway_rest_api.http-crud-tutorial-api.root_resource_id
    path_part = "items" 
}

resource "aws_api_gateway_method" "item_get" {
  rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
  resource_id = aws_api_gateway_resource.item.id
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "item_post"{
    rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
    resource_id = aws_api_gateway_resource.item.id
    http_method = "POST"
    authorization = "NONE"
}

resource "aws_api_gateway_method" "item_delete"{
    rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
    resource_id = aws_api_gateway_resource.item.id
    http_method = "DELETE"
    authorization = "NONE"
}

resource "aws_api_gateway_method" "item_put"{
    rest_api_id = aws_api_gateway_rest_api.http-crud-tutorial-api.id
    resource_id = aws_api_gateway_resource.item.id
    http_method = "PUT"
    authorization = "NONE"
}