#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd 
sudo systemctl enable httpd 

sudo yum install git -y
wget    https://releases.hashicorp.com/terraform/1.5.3/terraform_1.5.3_linux_amd64.zip
unzip terraform_1.5.3_linux_amd64.zip
 sudo mv terraform /usr/local/bin

 Sudo yum install make -y

 wget https://releases.hashicorp.com/packer/1.9.2/packer_1.9.2_linux_amd64.zip
 unzip packer_1.9.2_linux_amd64.zip
sudo mv packer /usr/local/bin

