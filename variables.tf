variable "name" {
    type = string
    description = "Name of the docker registry"

}

variable "isOnline" {
    type = bool
    default = true
    description = "Toggle switch to enable or disable online usage of this repository"

}

variable "port" {
    type = string
    description = "Port to announce service on"

}

variable "blobStoreName" {
    type = string
    default = "default"
    description = "Blob Storage wihin nexus to use"

}
