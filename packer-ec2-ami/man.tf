
resource "aws_instance" "web" {
  ami = "ami-0fb4d8308ff92396e"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
 

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