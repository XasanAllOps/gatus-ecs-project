module "vpc" {
  source      = "../../modules/network"
  environment = var.environment
  vpc_cidr    = var.vpc_cidr
  region      = var.region
}

module "alb" {
  source            = "../../modules/loadbalancer"
  environment       = var.environment
  alb_security_name = var.alb_security_name
  target_group_name = var.target_group_name
  container_port    = var.container_port
  # -- module dependencies -- #
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  certificate_arn = module.acm.certificate_arn
  # -- meta-arguments -- #
  depends_on = [module.vpc]
}

module "acm" {
  source            = "../../modules/acm"
  environment       = var.environment
  record_name       = var.record_name
  zone_name         = var.zone_name
  validation_method = var.validation_method
}

module "dns" {
  source        = "../../modules/dns"
  record_name   = var.record_name
  zone_name     = var.zone_name
  target_health = var.target_health
  # -- module dependencies -- #
  alb_zone_id  = module.alb.alb_zone_id
  alb_dns_name = module.alb.alb_dns_name
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}

module "ecs" {
  source                 = "../../modules/ecs"
  environment            = var.environment
  region                 = var.region
  container_insights     = var.container_insights
  ecs_service_name       = var.ecs_service_name
  ecs_cluster_name       = var.ecs_cluster_name
  desired_count          = var.desired_count
  task_family_name       = var.task_family_name
  retention_in_days      = var.retention_in_days
  task_level_cpu         = var.task_level_cpu
  task_level_memory      = var.task_level_memory
  container_name         = var.container_name
  container_image        = var.container_image
  container_level_cpu    = var.container_level_cpu
  container_level_memory = var.container_level_memory
  container_port         = var.container_port
  host_port              = var.host_port
  task_cloudwatch_logs   = var.task_cloudwatch_logs
  # -- module dependencies -- #
  vpc_id                 = module.vpc.vpc_id
  private_subnets        = module.vpc.private_subnets
  target_group_alb_arn   = module.alb.alb_target_group_arn
  alb_security_group     = module.alb.alb_security_group
  ecs_execution_role_arn = module.iam.ecs_execution_role_arn
  ecs_task_role_arn      = module.iam.ecs_task_role_arn
  # -- meta-arguments -- #
  depends_on = [module.alb]
}