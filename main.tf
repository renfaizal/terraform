# Configure Docker provider and connect to the local Docker socket
provider "docker" {
  host = "tcp://localhost:2375/"
}

# Create an Nginx container
resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
  name  = "nginx_server"
  ports {
    internal = 80
    external = 9090
  }
}
resource "docker_image" "nginx" {
  name = "nginx:alpine"
}
# Create a php-fpm container
resource "docker_container" "php" {
  image = "${docker_image.php-fpm.latest}"
  name  = "php_fpm"
}
resource "docker_image" "php-fpm" {
  name = "php:fpm-alpine"
}

