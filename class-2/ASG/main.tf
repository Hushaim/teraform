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



module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "example-asg"

  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
 availability_zones = ["us-east-2a" , "us-east-2b" , "us-east-2c"]

  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = data.aws_ami.ubuntu2.id
  instance_type     = "t3.micro"
  ebs_optimized     = true
  enable_monitoring = true
}