# terraform {
#   backend "remote" {
#     organization = "mido"

#     workspaces {
#       name = "terraform-docker"
#     }
#   }
# }

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

provider "docker" {
  #   host = "tcp://127.0.0.1:2376/"
}

# Create a container
resource "docker_container" "httpd" {
  image = docker_image.httpd.latest
  name  = "tut"
  volumes {
    # volume_name    = docker_volume.shared_volume.name
    host_path      = "/home/mido/demo-terra/episode-1/my_site/"
    container_path = "/usr/local/apache2/htdocs/"
    read_only      = false
  }
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_image" "httpd" {
  name         = "httpd:alpine"
  keep_locally = true
}

resource "docker_volume" "shared_volume" {
  name = "shared_volume"

}
