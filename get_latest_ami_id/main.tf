// Using this terraform file you get latest id of amazon2_ami
// I will add another types of different os



provider "aws" {
    region = "us-east-1"
  
}

data "aws_ami" "latest_amazonlinux" {
    owners = [ "137112412989" ]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-kernel*-x86_64-gp2"]
    }
  
}

data "aws_ami" "latest_ubuntu" {
    owners = [ "099720109477" ]
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu-*amd64-server*"]
    }
  
}

data "aws_ami" "latest_windows" {
    owners = [ "801119661308" ]
    most_recent = true
    filter {
        name = "name"
        values = ["Windows_Server-2022*"]
    }
  
}


output "latest_amazon2_linux_ami_id" {
    value = data.aws_ami.latest_amazonlinux.id
  
}

output "latest_windows_ami_id" {
    value = data.aws_ami.latest_windows.id
  
}

output "latest_ubuntu_linux_server_ami_id" {
    value = data.aws_ami.latest_ubuntu.id
  
}