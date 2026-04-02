terraform {
  backend "s3" {
    bucket       = "..."
    key          = "dev/ecs/tf.state"
    region       = "..."
    encrypt      = true
    use_lockfile = true
  }
}