variable "project_name" {
    default = "expense"
  
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "zone_name" {
    default = "lakshith.online"
}

variable "zone_id" {
    default = "Z047835510QA78G216HIV" 
}