#key pair import
resource "aws_key_pair" "deployer" {
  key_name   = "deployer176"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    team ="devops"
    env ="dev"
  }

}

