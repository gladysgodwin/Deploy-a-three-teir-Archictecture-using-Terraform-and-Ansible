terraform {
  cloud {
    organization = "AltSchoolProject-byGladys"

    workspaces {
      name = "Deploy-a-three-teir-Archictecture-using-Terraform-and-Ansible"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
