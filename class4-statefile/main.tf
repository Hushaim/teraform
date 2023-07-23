#key pair import
resource "aws_key_pair" "deployer" {
  key_name   = "deployer176"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    team ="dev7ops"
    env ="de3v"
  }

}

