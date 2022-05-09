resource "aws_instance" "instance-1" {
    ami = var.imagename
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "devops_project"
    subnet_id = var.sn
    vpc_security_group_ids = [var.sg]
    associate_public_ip_address = true	
    tags = {
        Name = var.instancename
        Env = "Prod"
        Owner = "Sree"
	    CostCenter = "ABCD"
    }
}