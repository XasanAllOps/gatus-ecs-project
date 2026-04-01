variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "region" {
  type = string
}

variable "alb_security_name" {
  type = string
}

variable "target_group_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "container_insights" {
  type = bool
}

variable "task_family_name" {
  type = string
}

variable "retention_in_days" {
  type    = number
  default = 5
}

variable "task_level_cpu" {
  type = number
}
variable "task_level_memory" {
  type = number
}

variable "container_name" {
  type = string
}

variable "container_level_cpu" {
  type = number
}
variable "container_level_memory" {
  type = number
}

variable "container_port" {
  type = number
}
variable "host_port" {
  type = number
}

variable "task_cloudwatch_logs" {
  type = string
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

variable "zone_name" {
  type        = string
  description = "The root domain name of your existing Route 53 Public Hosted Zone"
}

variable "record_name" {
  type        = string
  description = "The exact URL where you want the Gatus application to be accessible. This can be the root domain name (example.com) or a subdomain (app.example.com)"
}

variable "validation_method" {
  type = string
}

variable "target_health" {
  type = bool
}