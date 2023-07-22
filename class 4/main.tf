#resource "null_resource" "cluster" {

 # provisioner "local-exec" {
  #  command = "mkdir kaizen && touch testfile"
  #}
#}
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
  }



#key pair import
resource "aws_key_pair" "deployer" {
  key_name   = "deployer17"
  public_key = file ("~/.ssh/id_rsa.pub") 
 
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id


ingress {                                 #inbound rule
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }
ingress {                                 #inbound rule
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"  #-1 all protocol
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

}


resource "null_resource" "cluster" {
  triggers = {
    always_run = "${timestamp()}"
  }

  
  connection {
    host = element(aws_instance.web.*.public_ip, 0)
    type     = "ssh"
    user     = "ubuntu"
    private_key = file ("~/.ssh/id_rsa") 
  }

  provisioner "remote-exec" {
    
    inline = [
      "sudo apt updat -y",
      "sudo apt install apache2 -y"
    ]
  }
}
