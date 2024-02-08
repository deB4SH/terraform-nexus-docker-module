# terraform-nexus-docker-module
Terraform Module to create a docker registry in nexus with pull and push user.

NOTE: The provider is configured within the main terraform file.

## Example Usage:

The following listing shows a sample usage of this module.
```
module "docker-registry" {
  source = "github.com/deB4SH/terraform-nexus-docker-module?ref=1.0.0"

  for_each = { for dr in var.docker_repository : dr.name => dr}

  name = each.key
  isOnline = each.value.isOnline
  port = each.value.port
  blobStoreName = each.value.blobStoreName
}
```
This uses an array definiton for all docker repositories that should be created.
```
variable "docker_repository" {
  type = list(object({
    name = string
    isOnline = bool
    port = string
    blobStoreName = string
  }))
}
```

Where an example input may look like the following
```
docker_repository=[
    {
        name="test1"
        isOnline=true
        port="61000"
        blobStoreName="default"
    },
    {
        name="test2"
        isOnline=true
        port="61001"
        blobStoreName="default"
    }
]
```

This will result in the following objects within nexus.
* docker repository: test1
* docker repository: test2
* role for docker pull on registry test1: docker-test1-pull-role
* role for docker push on registry test1: docker-test1-push-role
* role for docker pull on registry test2: docker-test2-pull-role
* role for docker push on registry test2: docker-test2-push-role
* user for pull on docker registry test1: docker-test1-pull
* user for push on docker registry test1: docker-test1-push
* user for pull on docker registry test2: docker-test2-pull
* user for push on docker registry test2: docker-test2-push