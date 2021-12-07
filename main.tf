resource "aws_vpc" "SharjeelVPC" {
  cidr_block           = SharjeelVPC
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"


  tags = {
    Name = "SharjeelVPC"
  }
}
