# General
environment = "dev"
region      = "us-east-1"

# VPC
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b"]


# ECS
ecs_cluster_name     = "dev-cluster"
container_image      = "your-ecr-repo-url:latest"
container_port       = 80
task_cpu             = "256"
task_memory          = "512"
service_desired_count = 2

# RDS
db_engine_version    = "13.7"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name              = "devdb"
db_username          = "devuser"
db_password          = "DevPassword123!" # Consider using a secret management solution

# ALB
health_check_path    = "/health"

# Common Tags
common_tags = {
  Environment = "dev"
  Project     = "MyApp"
  ManagedBy   = "Terraform"
}