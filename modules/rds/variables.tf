# modules/rds/variables.tf

variable "environment" {}
variable "vpc_id" {}
variable "private_subnet_ids" {}
variable "ecs_security_group_id" {}
variable "db_engine_version" {}
variable "db_instance_class" {}
variable "db_allocated_storage" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "common_tags" {}