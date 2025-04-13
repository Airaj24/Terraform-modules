#*************** VPC ***********#

module "vpc" {
    source ="./modules/vpc"
    vpc_cidr = var.vpc_cidr_out
    pub_sub1 = var.pub_sub1_out
    pub_az1 = var.pub_az1_out
    pub_sub2 = var.pub_sub2_out
    pub_az2 = var.pub_az2_out
    pvt_sub1 = var.pvt_sub1_out
    pvt_az1 = var.pvt_az1_out
    pvt_sub2 = var.pvt_sub2_out
    pvt_az2 = var.pvt_az2_out
}

#************ EC2 *********#
module "ec2" {
    source ="./modules1/ec2"
    ec2_ami = var.raj_ami_id_out
    ec2_type = var.raj_instance_type_out                               
    raj_public_subnet_1_ec2 = module.vpc.raj_pub_sub_1_output
    raj_public_sg_ec2 = module.vpc.raj_public_sg_output
    raj_public_subnet_2_ec2 = module.vpc.raj_pub_sub_2_output
}

#************* db *********#
module "db" {
    source = "./modules2/db"
    db_username = var.db_username_out
    db_password = var.db_password_out
    az_db = var.az_db_out
    raj_private_sg_db = module.vpc.raj_private_sg_output
    raj_private_subnet_1_db = module.vpc.raj_pvt_sub_1_output
    raj_private_subnet_2_db = module.vpc.raj_pvt_sub_2_output
}

#*************** elb ************#

module "elb" {
    source = "./modules3/elb"
    load_balan_type = var.load_balan_type_out
    raj_public_sg_elb = module.vpc.raj_public_sg_output
    raj_public_sub_1_elb = module.vpc.raj_pub_sub_1_output
    raj_public_sub_2_elb = module.vpc.raj_pub_sub_2_output
    rajvpc_elb = module.vpc.rajvpc_output
    raj_web_1_elb = module.ec2.rajweb_1_output
    raj_web_2_elb = module.ec2.rajweb_2_output
}