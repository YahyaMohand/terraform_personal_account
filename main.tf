# environments/dev/main.tf

terraform {
  backend "s3" {
    bucket         = "test-terraform-state-bucket-123123"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test-terraform-lock-table"
  }
}

provider "aws" {
  region = var.region
}

module "networking" {
  source               = "./modules/networking"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = data.aws_availability_zones.available.names
  common_tags          = var.common_tags
}

module "ecr" {
  source          = "./modules/ecr"
  environment     = var.environment
  repository_name = "${var.environment}-repo"
  common_tags     = var.common_tags
}

module "elb" {
  source             = "./modules/elb"
  environment        = var.environment
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  health_check_path  = var.health_check_path
  common_tags        = var.common_tags
}

module "ecs" {
  source                = "./modules/ecs"
  environment           = var.environment
  vpc_id                = module.networking.vpc_id
  private_subnet_ids    = module.networking.private_subnet_ids
  alb_security_group_id = module.elb.alb_security_group_id
  target_group_arn      = module.elb.target_group_arn
  container_image       = var.container_image
  container_port        = var.container_port
  task_cpu              = var.task_cpu
  task_memory           = var.task_memory
  service_desired_count = var.service_desired_count
  common_tags           = var.common_tags
}

module "rds" {
  source                = "./modules/rds"
  environment           = var.environment
  vpc_id                = module.networking.vpc_id
  private_subnet_ids    = module.networking.private_subnet_ids
  ecs_security_group_id = module.ecs.ecs_security_group_id
  db_engine_version     = var.db_engine_version
  db_instance_class     = var.db_instance_class
  db_allocated_storage  = var.db_allocated_storage
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  common_tags           = var.common_tags
}

data "aws_availability_zones" "available" {
  state = "available"
}