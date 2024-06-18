variable "region" {
  type = string
}

variable "ports" {
  type = list(number)

}

variable "ami" {
  type = string

}

variable "instance_type" {
  type = string

}

variable "key_name" {
  type = string

}
variable "host-name" {

  type = string
}

variable "connection-user" {
  type = string
}

data "aws_ecr_repository" "foo" {
  name = aws_ecr_repository.foo.name
}

variable "secret_key" {
  type = string

}
variable "access_key" {
  type = string
}

variable "tg-name" {
  type = string

}

variable "target_port" {
  type = string
}

variable "tg_protocol" {

  type = string
}

variable "enduserport" {
  type = string

}
variable "Environment" {
  type = string

}

variable "load_balancer-name" {
  type = string
}

variable "elb-type" {
  type = string

}