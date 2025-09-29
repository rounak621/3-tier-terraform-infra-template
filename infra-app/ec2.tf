#key pair
resource "aws_key_pair" "deployer" {
  key_name   = "${var.env}-infrsa-app-key"
  public_key = file("terra-key-ec2.pub")
  tags = {
    Environment = var.env 
  }
}
#VPC default
resource "aws_default_vpc" "default" {
  
}
# sec grp
resource "aws_security_group" "my_sec_grp_new" {
    name = "${var.env}-infra-app-sg"
    description = "Allow SSH and HTTP"
    vpc_id = aws_default_vpc.default.id
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
            Name = "${var.env}-infra-app-sg"
        }
}
#ec2 instance
resource "aws_instance" "my_instance" {
    count = var.instance_count
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.my_sec_grp_new.name]
    instance_type = var.instance_type
    ami = var.ec2_ami_id #Ubuntu Linux AMI (HVM), SSD Volume Type - us-east-1
    user_data = file("install_nginx.sh")
    root_block_device {
      volume_size = var.env == "prd" ? 20 : 10 
      volume_type = "gp3"
    }
    tags = {
      Name = "${var.env}-infra-app-ec2"
      Environment = var.env
    }
}