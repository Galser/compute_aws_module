variable "name" {
  type        = string
  description = "Name for tags and etc"
}

variable "ami" {
  description = "AMI for the instance"
  default     = ""
}

variable "instance_type" {
  description = "AWS Type of instance"
  default     = "t2.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "security_groups" {
  type        = list
  description = "List of security groups IDs"
}

variable "key_name" {
  type        = string
  description = "SSH Key ID  , stored in AWS"
}

variable "key_path" {
  description = "Local SSH key path (priavte part)"
}

variable "root_volume_size" {
  type        = string
  description = "Size of the root volume in GB"
  default     = 50
}

# for fallback AMI selection
variable "ubuntu_account_number" {
  default = "099720109477"
}