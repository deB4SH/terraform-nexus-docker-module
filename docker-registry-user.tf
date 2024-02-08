resource "random_password" "pull-user-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_password" "push-user-password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "nexus_security_user" "pull-user" {
  userid     = "docker-${var.name}-pull"
  firstname  = "Docker Pull"
  lastname   = "${var.name}"
  email      = "svc.docker.${var.name}-pull@local.lan"
  password   = random_password.pull-user-password.result
  roles      = ["docker-${var.name}-pull-role"]
  status     = "active"
  depends_on = [nexus_repository_docker_hosted.registry, nexus_security_role.security-role-pull]
}

resource "nexus_security_user" "push-user" {
  userid     = "docker-${var.name}-push"
  firstname  = "Docker Push"
  lastname   = "${var.name}"
  email      = "svc.docker.${var.name}-push@local.lan"
  password   = random_password.push-user-password.result
  roles      = ["docker-${var.name}-push-role"]
  status     = "active"
  depends_on = [nexus_repository_docker_hosted.registry, nexus_security_role.security-role-push]
}