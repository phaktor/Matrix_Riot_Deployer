resource "aws_security_group" "Matrix-SecG" {
  name = "Matrix-SecG"
  vpc_id = var.VpcId
  description = "Outbound/Inbound Rules for Matrix Instance"
  egress {
    protocol        = "tcp"
    from_port       = 443
    to_port         = 443
    cidr_blocks     = ["0.0.0.0/0"] #For Internet Connection
  }
  egress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    cidr_blocks     = ["0.0.0.0/0"] #For Internet Connection
  }
  ingress {
    protocol        = "tcp"
    from_port       = 8008
    to_port         = 8008
    cidr_blocks     = ["0.0.0.0/0"] #For Matrix Connection
  }
}

