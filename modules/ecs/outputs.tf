# modules/ecs/outputs.tf

output "cluster_arn" {
  value = aws_ecs_cluster.main.arn
}

output "service_name" {
  value = aws_ecs_service.main.name
}
output "ecs_security_group_id" {
  description = "The security group ID for the ECS cluster"
  value       = aws_security_group.ecs_tasks.id
}
