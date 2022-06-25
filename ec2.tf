resource "aws_instance" "First-EC2" {
    subnet_id = aws_subnet.first_subnet
    instance_type = "t2.micro"
}