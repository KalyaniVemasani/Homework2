provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  az                  = "us-east-1a"
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnet_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "your-unique-static-bucket-name-12345"
}

module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = "user-logins"
}
