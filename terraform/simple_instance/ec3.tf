provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  vpc_id = "vpc-082ff8861a4f86af0"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "41c0d878ca3480704f13543cad27285ad333f1eb"
    git_file             = "terraform/simple_instance/ec3.tf"
    git_last_modified_at = "2021-12-04 00:51:46"
    git_last_modified_by = "91766267+palogitjl@users.noreply.github.com"
    git_modifiers        = "91766267+palogitjl"
    git_org              = "palogitjl"
    git_repo             = "terragoat"
    yor_trace            = "1280c57c-3a7b-4276-b47f-ff6ab11e06bd"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_file             = "terraform/simple_instance/ec3.tf"
    git_last_modified_at = "2021-12-04 00:51:46"
    git_last_modified_by = "91766267+palogitjl@users.noreply.github.com"
    git_modifiers        = "91766267+palogitjl"
    git_org              = "palogitjl"
    git_repo             = "terragoat"
    yor_trace            = "96f375f1-2ee0-428f-bf75-bbb19af78127"
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
