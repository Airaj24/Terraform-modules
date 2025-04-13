#  creation of web server 1

resource "aws_instance" "web_1" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  associate_public_ip_address = true
  #subnet_id = aws_subnet.public_subnet_1.id
  subnet_id = var.raj_public_subnet_1_ec2
  user_data = file ("${path.module}/web-apps.sh")
  # security_groups = [aws_security_group.public_sg.id]
   vpc_security_group_ids = [var.raj_public_sg_ec2]
   key_name = "terraform"
    tags = {
    Name = "web_1"
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = self.public_ip
    private_key = file("${path.module}/private_key/terraform.pem")
  }

provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }

provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html",
    ]
  }
}


#  creation of web server 2

resource "aws_instance" "web_2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  associate_public_ip_address = true
  #subnet_id = aws_subnet.public_subnet_2.id
  subnet_id = var.raj_public_subnet_2_ec2
  user_data = file ("${path.module}/web-apps.sh")
   # security_groups = [aws_security_group.public_sg.id]
   vpc_security_group_ids = [var.raj_public_sg_ec2]
   key_name = "terraform"
    tags = {
    Name = "web_2"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = self.public_ip
    private_key = file("${path.module}/private_key/terraform.pem")
  }


provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }

provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html",
    ]
  }
}

