#resource "aws_instance" "First-EC2" {
#    subnet_id     = aws_subnet.first_subnet.id
#    instance_type = "t2.micro"
#    ami           = "ami-2757f631"
#}

#resource "aws_instance" "Second-EC2" {
#    subnet_id = aws_subnet.second_subnet.id
#    instance_type = "t2.micro"
#    ami           = "ami-2757f631"
#}