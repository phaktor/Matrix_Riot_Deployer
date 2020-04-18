data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_network_interface" "Matrix-Instance-NetworkInterface" {
  subnet_id = var.PublicSubnet
  security_groups = [var.Matrix-SecG]
}

resource "aws_eip" "ElasticIP" {
  vpc = true
}

data "template_file" "package_installer" {
  template = file("Scripts/matrix_installer.sh")
}

resource "aws_instance" "Matrix-Instance" {
  ami = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  iam_instance_profile = var.SSM-Instance-Profile
  user_data = data.template_file.package_installer.rendered
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.Matrix-Instance-NetworkInterface.id
  }

  tags = {
    Name = "Matrix-Instance"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.Matrix-Instance.id
  allocation_id = aws_eip.ElasticIP.id
}
