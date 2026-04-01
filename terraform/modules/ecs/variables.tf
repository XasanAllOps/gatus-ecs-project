# -- module (root) related variables -- #
variable "vpc_id" {
  type = string
}

variable "alb_security_group" {
  type = string
}

variable "target_group_alb_arn" {
  type = string
}

variable "ecs_execution_role_arn" {
  type = string
}

variable "ecs_task_role_arn" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "task_cloudwatch_logs" {
  type = string
}

# --- normal variables --- #
variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "container_insights" {
  type = bool
}

variable "ecs_service_name" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "desired_count" {
  type = number
}

variable "task_family_name" {
  type = string
}

variable "retention_in_days" {
  type = number
}

variable "task_level_cpu" {
  type = number
}
variable "task_level_memory" {
  type = number
}

variable "container_image" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type = number
}
variable "host_port" {
  type = number
}

variable "container_level_cpu" {
  type = number
}
variable "container_level_memory" {
  type = number
}