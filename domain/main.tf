provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_route53_zone" "front" {
  name          = "ninaaano.shop"
  force_destroy = true
}