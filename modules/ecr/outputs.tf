# modules/ecr/outputs.tf

output "repository_url" {
  value = aws_ecr_repository.main.repository_url
}