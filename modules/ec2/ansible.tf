resource "aws_instance" "instance-2" {
    ami = "ami-0022f774911c1d690"
    availability_zone = "us-east-1c"
    instance_type = "t2.micro"
    key_name = "venkatgiri877"
    subnet_id = "subnet-0ee0df63b3b0eb282"
    vpc_security_group_ids = [var.sg]
    associate_public_ip_address = true	
    tags = {
        Name = "Ansible"
        Env = "Prod"
        Owner = "Venkat"
	    CostCenter = "ABCD"
    }
}
resource "aws_instance" "instance-3" {
    ami = "ami-0022f774911c1d690"
    availability_zone = "us-east-1c"
    instance_type = "t2.micro"
    key_name = "venkatgiri877"
    subnet_id = "subnet-0ee0df63b3b0eb282"
    vpc_security_group_ids = [var.sg]
    associate_public_ip_address = true	
    tags = {
        Name = "ec2-server"
        Env = "Prod"
        Owner = "Venkat"
	    CostCenter = "ABCD"
    }
}
resource "null_resource" "AnsibleInstall" {
  provisioner "remote-exec" {
    inline = [
      "sudo wget https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip",
      "sudo unzip terraform_1.1.9_linux_amd64.zip",
      "sudo mv terraform /usr/local/bin ",
      "sudo yum install pip -y",
      "sudo pip install ansible"
    ]
    connection {
      type = "ssh"
      user = "ec2-user"
      #password = "India@123456"
      private_key = file("venkatgiri877.pem")
      host = aws_instance.instance-2.public_ip
    }
  }
}