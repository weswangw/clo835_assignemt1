terraform {
  required_version = ">= 1.6.0"
  required_providers { aws = { source = "hashicorp/aws", version = "~> 5.0" } }
}
provider "aws" { region = var.region }
resource "aws_ecr_repository" "webapp" {
  name = "${var.name_prefix}-webapp"
  image_scanning_configuration { scan_on_push = true }
  image_tag_mutability = "MUTABLE"
}
resource "aws_ecr_repository" "mysql" {
  name = "${var.name_prefix}-mysql"
  image_scanning_configuration { scan_on_push = true }
  image_tag_mutability = "MUTABLE"
}
output "webapp_repo" { value = aws_ecr_repository.webapp.repository_url }
output "mysql_repo"  { value = aws_ecr_repository.mysql.repository_url }
