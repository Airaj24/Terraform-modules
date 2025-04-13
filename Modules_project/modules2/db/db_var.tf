variable "db_username" {
  type = string
 # default = "admin"
  }

variable "db_password" {
    type = string
   # default = "Admin123"
}

variable "az_db" {
    type = string
  #  default = "ap-south-1a"
}

variable raj_private_sg_db {}

variable raj_private_subnet_1_db {}

variable raj_private_subnet_2_db {}