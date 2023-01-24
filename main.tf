terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1e"
}

#### EC2 Instance####

resource "aws_instance" "LAMP_Server" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo apt-get install -y mysql-server",
      "sudo apt-get install -y php libapache2-mod-php",
    ]
  }

  tags = {
    Name = "LAMP_Serv"
    #vpc_security_group.id = [aws_security_group.web.id]
  }
}

### Configure MYSQL#####



/*
#### attach EIP to EC2####

resource "aws_eip" "LAMP_Server" {
  instance = aws_instance.LAMP_Server.id
}
## End EIP

output "EIP" {
  value = aws_eip.LAMP_Server.public_ip
}


 # bootstrap webserver
 resource "aws_instance" "webserv" {
    ami = "ami-0d593311db5abb72b" 
    instance_type = "t3.micro"
    user_data = <<EOF
    #!/bin/bash
    yum -y update
    yum -y install httpd
    service httpd start
    chkconfig httpd
    EOF
   }
resource "aws_security_group" "webserv" {
  #Name = "webServer-5g"
  description = "Securty group for webserver"

    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port = 0
      to_port = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
}
    */
