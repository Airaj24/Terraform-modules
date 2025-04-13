output  rajvpc_output {
  value       = aws_vpc.myvpc.id
}

output  raj_pub_sub_1_output {
  value       = aws_subnet.public_subnet_1.id
}

output  raj_pub_sub_2_output {
  value       = aws_subnet.public_subnet_2.id
}

output  raj_pvt_sub_1_output {
  value       = aws_subnet.private_subnet_1.id
}

output  raj_pvt_sub_2_output {
  value       = aws_subnet.private_subnet_2.id
}

output  raj_public_sg_output {
  value       = aws_security_group.public_sg.id
}

output  raj_private_sg_output {
  value       = aws_security_group.private_sg.id
}
