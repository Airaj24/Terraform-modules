variable "vpc_cidr" {
  type = string
  #default = "10.0.0.0/16"
}

variable "pub_sub1" {
    type = string
    #default = "10.0.1.0/24"
}

variable "pub_az1" {
   type = string
   #default = "ap-south-1a"
}

variable "pub_sub2" {
    type = string
    #default = "10.0.2.0/24"
}

variable "pub_az2" {
   type = string
   #default = "ap-south-1b"
}

variable "pvt_sub1" {
    type = string
    #default = "10.0.3.0/24"
}

variable "pvt_az1" {
   type = string
   #default = "ap-south-1a"
}

variable "pvt_sub2" {
    type = string
    #default = "10.0.4.0/24"
}

variable "pvt_az2" {
   type = string
   #default = "ap-south-1b"
}
