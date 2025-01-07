resource "nexus_security_role" "security-role-pull" {
  description = "Docker Pull Role for ${var.name}"
  name        = "docker-${var.name}-pull-role"
  privileges = [
    "nx-repository-view-docker-${var.name}-read",
    "nx-repository-view-docker-${var.name}-browse",
  ]
  roleid = "docker-${var.name}-pull-role"
  depends_on = [nexus_repository_docker_hosted.registry]
}

resource "nexus_security_role" "security-role-push" {
  description = "Docker Pull Role for ${var.name}"
  name        = "docker-${var.name}-push-role"
  privileges = [
    "nx-repository-view-docker-${var.name}-read",
    "nx-repository-view-docker-${var.name}-browse",
    "nx-repository-view-docker-${var.name}-add",
    "nx-repository-view-docker-${var.name}-edit",
  ]
  roleid = "docker-${var.name}-push-role"
  depends_on = [nexus_repository_docker_hosted.registry]
}