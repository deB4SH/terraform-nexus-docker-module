resource "nexus_repository_docker_hosted" "registry" {
  name   = "${var.name}"
  online = var.isOnline

  docker {
    force_basic_auth = false
    v1_enabled       = false
    http_port        = "${var.port}"
  }

  storage {
    blob_store_name                = "${var.blobStoreName}"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}