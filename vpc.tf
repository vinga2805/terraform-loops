resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "Demo-vpc"
    Environment = "stage"
  }
}
resource "aws_subnet" "subnets" {
  count = "${var.env == "prod" ? 4 : 2}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr,2,count.index)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "subnet-${count.index + 1}"
    Environment = "stage"
  }
}
