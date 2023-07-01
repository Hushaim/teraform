#key pair import
resource "aws_key_pair" "deployer" {
  key_name   = "deployer17"
  public_key = file ("~/.ssh/id_rsa.pub") 
  tags = local.commaom_tags
}
