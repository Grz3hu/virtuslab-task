variable "docker_image" {
	type = string
	default = "grz3siu/virtuslab-task:latest"
}

variable "app_name" {
	type = string
	default = "virtuslab-task"
}

variable "docker_ports" {
	type = object({
    		internal = number
    		external = number
  	})
  	default = {
    		internal = 80
    		external = 8081
    	}
}

terraform {
	required_providers {
  		docker = {
   			source  = "kreuzwerker/docker"
   		 	version = "2.16.0"
  			 }
	}
}

resource "docker_container" "virtuslab-task" {
	image = var.docker_image
	name = var.app_name
	restart = "always"
	ports {
		internal = var.docker_ports.internal
		external = var.docker_ports.external
	}
}
