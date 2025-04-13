#!/bin/bash

# Update the system
sudo yum update -y

# Install Apache (httpd)
sudo yum install -y httpd

# Enable Apache to start on boot
sudo systemctl enable httpd

# Start Apache service right now
sudo systemctl start httpd

# (Optional) Allow HTTP traffic in firewall (if you're using firewalld)
# sudo firewall-cmd --permanent --add-service=http
# sudo firewall-cmd --reload

# Check the status
sudo systemctl status httpd
