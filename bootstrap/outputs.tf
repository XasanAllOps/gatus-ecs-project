output "github_app_role_arn" {
  value       = module.iam.oidc_role_arn
}

output "github_infra_role_arn" {
  value       = module.iam.infra_role_arn
}

output "bucket_name" {
  value       = module.s3.bucket_name
}

output "ecr_repository_name" {
  value       = module.ecr.ecr_repository_name
}