# modules/ecr/main.tf

resource "aws_ecr_repository" "main" {
  name                 = "${var.environment}-${var.repository_name}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.common_tags
}



