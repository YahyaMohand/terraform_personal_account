# modules/ecs/variables.tf

variable "environment" {}
variable "vpc_id" {}
variable "private_subnet_ids" {}
variable "alb_security_group_id" {}
variable "target_group_arn" {}
variable "container_image" {}
variable "container_port" {}
variable "task_cpu" {}
variable "task_memory" {}
variable "service_desired_count" {}
variable "common_tags" {}