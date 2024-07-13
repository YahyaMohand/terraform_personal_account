# environments/dev/outputs.tf

output "alb_dns_name" {
  value = module.elb.alb_dns_name
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}