variable "region" {
  type        = string
  description = "AWS region"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t3.micro"
}
