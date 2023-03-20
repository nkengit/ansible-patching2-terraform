resource "aws_instance" "ansible_node" {
  count                  = 3
  ami                    = "ami-09cd747c78a9add63" # or any other AMI
  instance_type          = "t2.micro"
  key_name               = "test-key"
  vpc_security_group_ids = [aws_security_group.team4_ssh.id]

  tags = {
    Name = "ansible-node${count.index + 1}"
    node = "node${count.index + 1}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Users/mac/Downloads/test-key.pem")
    host        = self.public_ip
  }

  #   provisioner "remote-exec" {
  #     inline = [
  #       "sudo amazon-linux-extras install ansible2 -y",
  #     ]
  #   }
}

resource "aws_instance" "ansible_master" {
  count                  = 1
  ami                    = "ami-09cd747c78a9add63" # or any other AMI
  instance_type          = "t2.medium"
  key_name               = "test-key"
  vpc_security_group_ids = [aws_security_group.team4_ssh.id]

  tags = {
    Name = "ansible_master"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Users/mac/Downloads/test-key.pem")
    host        = self.public_ip
  }

  #   provisioner "remote-exec" {
  #     inline = [
  #       "sudo amazon-linux-extras install ansible2 -y",
  #     ]
  #   }
}

