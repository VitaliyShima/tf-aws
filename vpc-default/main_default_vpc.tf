resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = var.availability_zone_az1

  tags = {
    Name = "Default subnet for ${var.availability_zone_az1}"
  }
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = var.availability_zone_az2

  tags = {
    Name = "Default subnet for ${var.availability_zone_az2}"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id

  ingress {
    protocol  = "-1"
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
