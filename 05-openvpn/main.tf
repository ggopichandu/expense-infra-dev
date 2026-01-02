resource "aws_key_pair" "vpn" {
  key_name   = "vpn"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKzjY5FMBKjyW/Nt7hIEvZGK8GPBGRHAYEZ/ioS//eOX Gopichandg@Gopichand"
  #public_key = file("~/.ssh/openvpn.pub")
}


# resource "aws_instance" "vpn" {
#   key_name = aws_key_pair.vpn.key_name  
#   ami                    = data.aws_ami.ami_info.id
#   vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
#   instance_type          = "t3.micro"
#   subnet_id   = local.public_subnet_id

#   lifecycle {
#     prevent_destroy = true
#   }

#   tags = merge(
#     var.common_tags,
#     {
#         Name = "${var.project_name}-${var.environment}-vpn"
#     }
#   )
# }

module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"
  key_name = aws_key_pair.vpn.key_name
  name = "${var.project_name}-${var.environment}-vpn"
  instance_type = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  subnet_id     = local.public_subnet_id
  ami           = data.aws_ami.ami_info.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-vpn"
    }
  )
}