provider "aws" {
  region     = "us-east-1"
  access_key = "####"
  secret_key = "###"
}

module "opstree" {
    source = "./modules/vpc"
    vpc_name = "opstree"
    vpc_cidr = "18.0.0.0/16"
    environment = "Dev"
    IGW_name = "opstree_IG"
    public_subnet1_name = "opstree_SN1"
    public_subnet2_name = "opstree_SN2"
    public_subnet3_name = "opstree_SN3"
    public_subnet1_cidr = "18.0.1.0/24"
    public_subnet2_cidr = "18.0.2.0/24"
    public_subnet3_cidr = "18.0.3.0/24"
    Main_Routing_Table = "opstree_RT"
}
module "jenkinsec2" {
    source = "./modules/ec2"
    imagename = "ami-0022f774911c1d690"
    sn = "${module.opstree.subnet1id}"
    sg = "${module.opstree.sgid}"
    instancename = "Jenkins"
}
# module "infosys" {
#     source = "./modules/vpc"
#     vpc_name = "infosys"
#     vpc_cidr = "19.0.0.0/16"
#     environment = "Dev"
#     IGW_name = "infosys_IG"
#     public_subnet1_name = "infosys_SN1"
#     public_subnet2_name = "infosys_SN2"
#     public_subnet3_name = "infosys_SN3"
#     public_subnet1_cidr = "19.0.1.0/24"
#     public_subnet2_cidr = "19.0.2.0/24"
#     public_subnet3_cidr = "19.0.3.0/24"
#     Main_Routing_Table = "infosys_RT"
# }

# module "avizva" {
#     source = "./modules/vpc"
#     vpc_name = "avizva"
#     vpc_cidr = "20.0.0.0/16"
#     environment = "Dev"
#     IGW_name = "avizva_IG"
#     public_subnet1_name = "avizva_SN1"
#     public_subnet2_name = "avizva_SN2"
#     public_subnet3_name = "avizva_SN3"
#     public_subnet1_cidr = "20.0.1.0/24"
#     public_subnet2_cidr = "20.0.2.0/24"
#     public_subnet3_cidr = "20.0.3.0/24"
#     Main_Routing_Table = "avizva_RT"
# }