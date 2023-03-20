output "public_ips" {
  value = aws_instance.ansible_node.*.public_ip
}

output "public_ip" {
  value = aws_instance.ansible_master.*.public_ip
}