variable "vpc_cidr" {
   default = "192.168.0.0/24"
}

data "aws_availability_zones" "azs" {
}
variable "env" {
   default = "stage"
}
