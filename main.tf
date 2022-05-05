provider "aws" {
  region     = "us-east-1"
  #access_key = "AKIARMSALXDJHRJDCGTD"
  #secret_key = "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"
}
#AKIARMSALXDJHRJDCGTD
#gDEBp4IMvywfu3ih43/m3rqsa4A6HX07y4SC3elV

module "capgemini" {
    source = "./modules/vpc"
    vpc_name = "capgemini"
    vpc_cidr = "18.0.0.0/16"
    environment = "Dev"
    IGW_name = "capgemini_IG"
    public_subnet1_name = "capgemini_SN1"
    public_subnet2_name = "capgemini_SN2"
    public_subnet3_name = "capgemini_SN3"
    public_subnet1_cidr = "18.0.1.0/24"
    public_subnet2_cidr = "18.0.2.0/24"
    public_subnet3_cidr = "18.0.3.0/24"
    Main_Routing_Table = "capgemini_RT"
}
module "capec2" {
    source = "./modules/ec2"
    imagename = "ami-0022f774911c1d690"
    sn = "${module.capgemini.subnet1id}"
    sg = "${module.capgemini.sgid}"
    instancename = "capServer1"
 
}

module "infosys" {
    source = "./modules/vpc"
    vpc_name = "infosys"
    vpc_cidr = "19.0.0.0/16"
    environment = "Dev"
    IGW_name = "infosys_IG"
    public_subnet1_name = "infosys_SN1"
    public_subnet2_name = "infosys_SN2"
    public_subnet3_name = "infosys_SN3"
    public_subnet1_cidr = "19.0.1.0/24"
    public_subnet2_cidr = "19.0.2.0/24"
    public_subnet3_cidr = "19.0.3.0/24"
    Main_Routing_Table = "infosys_RT"
}

module "avizva" {
    source = "./modules/vpc"
    vpc_name = "avizva"
    vpc_cidr = "20.0.0.0/16"
    environment = "Dev"
    IGW_name = "avizva_IG"
    public_subnet1_name = "avizva_SN1"
    public_subnet2_name = "avizva_SN2"
    public_subnet3_name = "avizva_SN3"
    public_subnet1_cidr = "20.0.1.0/24"
    public_subnet2_cidr = "20.0.2.0/24"
    public_subnet3_cidr = "20.0.3.0/24"
    Main_Routing_Table = "avizva_RT"
}