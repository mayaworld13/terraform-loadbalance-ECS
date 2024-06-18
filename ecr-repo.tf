resource "aws_ecr_repository" "foo" {
  name = "ecr-docker"

  image_scanning_configuration {
    scan_on_push = false
  }
}