module "vpc" {
  source = "./modules/vpc"
  cidr = var.vpc_cidr
  azs = var.azs
  public_subnet_cidrs =  var.public_subnet_cidrs
  private_subnet_cidrs =  var.private_subnet_cidrs
  private_db_subnet_cidrs = var.private_db_subnet_cidrs

}

module "nat" {
  source = "./modules/nat"
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "routes" {
  source = "./modules/routes"
  vpc_id = module.vpc.vpc_id
  nat_gateway_ids = module.nat.nat_gateway_ids
  igw_id = module.vpc.igw_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_app_subnet_ids = module.vpc.private_app_subnet_ids
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "ec2" {
  source = "./modules/ec2"
  target_group_arn = module.alb.target_group_arn
  ami_id = var.ami_id
  instance_type = var.instance_type
  private_subnet_ids = module.vpc.private_app_subnet_ids

}

module "rds" {
  source = "./modules/rds"
  private_db_subnet_ids = module.vpc.private_db_subnet_ids
  db_name               = "three_tier_db"
  db_username           = "admin"
  db_password           = var.db_password
}