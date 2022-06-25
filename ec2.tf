resource "aws_instancce" "First-EC2" {
    vpc_id = aws_vpc.vpc.vpc_id
    instance_type = "t2.micro"
}