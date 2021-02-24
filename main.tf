# fall back AMI selection for Ubuntu 18.04
# Get the AMI in region
data "aws_ami" "ubuntu-18_04" {
  most_recent = true
  owners      = [var.ubuntu_account_number]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

locals {
  ami = var.ami != "" ? var.ami : data.aws_ami.ubuntu-18_04.id
}

resource "aws_instance" "ec2" {
  ami                         = local.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_groups
  key_name                    = var.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = {
    "Name"      = "${var.name}-andrii",
    "andriitag" = "true",
  }

  volume_tags = {
    "Name"      = "${var.name}-andrii",
    "andriitag" = "true",
  }

  connection {
    user = "ubuntu"
    type = "ssh"
    private_key = file(var.key_path)
    host        = self.public_ip
  }

  /* provisioner "remote-exec" {
    script = "${path.module}/scripts/provision.sh"
  }
 */
}

