output "ecr_repository_arn" {
  value = aws_ecr_repository.main.arn
}

output "ecr_repository_name" {
  value = aws_ecr_repository.main.repository_name
}