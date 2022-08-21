terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.20.2"
    }
  }
}

provider "docker" {
  # Configuration options
}

resource "docker_image" "api" {
  name = "guray/benkimim:0.2"
}

resource "docker_container" "api" {
  name  = "api"
  image = docker_image.api.name
  restart = "always"
  ports {
    internal = "8000"
    external = "8000"
  }
}

output "container_ip" {
  value = docker_container.api.network_data[0].ip_address
}