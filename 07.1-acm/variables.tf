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
    default = "gopichand.online"
}

variable "zone_id" {
    default = "Z05089881SMV5BSCETO2M" 
}