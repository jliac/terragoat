provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "66ce54cf4765c4eadffa85562405006762858e3a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-04 00:43:53"
    git_last_modified_by = "91766267+palogitjl@users.noreply.github.com"
    git_modifiers        = "91766267+palogitjl"
    git_org              = "palogitjl"
    git_repo             = "terragoat"
    yor_trace            = "4b92b677-0a3a-4303-a78d-73a25d2da877"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "66ce54cf4765c4eadffa85562405006762858e3a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-04 00:43:53"
    git_last_modified_by = "91766267+palogitjl@users.noreply.github.com"
    git_modifiers        = "91766267+palogitjl"
    git_org              = "palogitjl"
    git_repo             = "terragoat"
    yor_trace            = "2035ecca-3153-4a7c-a7ef-1e825afd406e"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
