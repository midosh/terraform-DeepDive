terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
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
  ports {
      internal = 80
      external = 8000
  }
}

resource "docker_image" "httpd" {
  name = "httpd:alpine"
  keep_locally = false
}
