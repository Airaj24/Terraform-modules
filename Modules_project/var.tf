#************ VPC ************#

variable "region" {
  type = string
  default = "ap-south-1"
}

variable "vpc_cidr_out" {
  type = string
  default = "10.0.0.0/16"
}

variable "pub_sub1_out" {
    type = string
    default = "10.0.1.0/24"
}

variable "pub_az1_out" {
   type = string
   default = "ap-south-1a"
}

variable "pub_sub2_out" {
    type = string
    default = "10.0.2.0/24"
}

variable "pub_az2_out" {
   type = string
   default = "ap-south-1b"
}

variable "pvt_sub1_out" {
    type = string
    default = "10.0.3.0/24"
}

variable "pvt_az1_out" {
   type = string
   default = "ap-south-1a"
}

variable "pvt_sub2_out" {
    type = string
    default = "10.0.4.0/24"
}

variable "pvt_az2_out" {
   type = string
   default = "ap-south-1b"
}

#***************** ec2 *****************#


variable "raj_ami_id_out" {
  type        = string
  default     = "ami-002f6e91abff6eb96"
}

variable "raj_instance_type_out" {
  type        = string
  default     = "t2.micro"
}

#************ db ************#

variable "db_username_out" {
  type = string
  default = "admin"
}

variable "db_password_out" {
  type = string
  default = "Admin123"
}

variable "az_db_out" {
  type = string
  default = "ap-south-1a"
}


#********* elb ********#

variable "load_balan_type_out" {
  type = string
  default = "application"
}

