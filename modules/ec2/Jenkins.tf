resource "aws_instance" "instance-1" {
    ami = var.imagename
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "venkatgiri877"
    subnet_id = var.sn
    vpc_security_group_ids = [var.sg]
    associate_public_ip_address = true	
    tags = {
        Name = var.instancename
        Env = "Prod"
        Owner = "Venkat"
	    CostCenter = "ABCD"
    }
}
resource "null_resource" "JenkinsInstall" {
  provisioner "remote-exec" {
    inline = [
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo amazon-linux-extras install epel -y",
      "sudo amazon-linux-extras install java-openjdk11 -y",
      "sudo yum install jenkins -y",
      "sudo systemctl start jenkins"
    ]
    connection {
      type = "ssh"
      user = "ec2-user"
      #password = "India@123456"
      private_key = file("venkatgiri877.pem")
      host = aws_instance.instance-1.public_ip
    }
  }
}