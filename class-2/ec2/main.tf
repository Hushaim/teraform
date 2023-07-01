
data "aws_ami" "ubuntu2" {    #data or resource. #ubuntu or can be anyname
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]  # all the images start with this name. #*=all
  }

  filter {
    name   = "virtualization-type" #vm hardwear type
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical=offical.  #owener account ID
}

resource "aws_instance" "web" {
  ami           =data.aws_ami.ubuntu2.id  
  instance_type = "t2.micro"
  #count = 1  # how many vm
  availability_zone = "us-east-1a"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
  tags = {
    Name = "HelloWorld"
  }

} 

output ec2 {
    value = aws_instance.web.public_ip
}

output ec2y {
    value = aws_instance.web.private_ip
}

