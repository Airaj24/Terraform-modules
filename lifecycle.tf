
# Create EC2 Instance
resource "aws_instance" "web" {
  ami               = "ami-0f1dcc636b69a6438" # Amazon Linux
  instance_type     = "t2.micro"
  # availability_zone = "ap-south-1a"
  availability_zone = "ap-south-1b"
  tags = {
    "Name" = "web-1"
  }
  lifecycle {
   #ignore_changes = [ami, availability_zone]
    ignore_changes = [tags]
  }
}