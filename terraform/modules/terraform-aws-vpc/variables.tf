variable "vpc_name" {
  description = "VPC Name tag"
  type        = string
}

variable "azs" {
  description = "List of availability zones in the region that VPC span"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR allocated to VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "domain_name" {
  description = "The suffix domain name to use by default when resolving non FQDN. E.g consul.com"
  type        = string
  default     = "codelab.net"
}

variable "dns_servers" {
  description = "List of name servers to configure in `/etc/resolv.conf`"
  type        = list(string)
  default     = []
}

variable "ntp_servers" {
  description = "List of NTP servers"
  type        = list(string)
  default     = []
}


variable "private_azs" {
  description = "List of the availability zones that private subnet can be created in."
  type        = list(string)
}

variable "private_subnet_tags" {
  description = "Tags of private subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnets" {
  type = list(map(any))

}

variable "public_azs" {
  description = "List of the availability zones that public subnet can be created in."
  type        = list(string)
}

variable "public_subnet_tags" {
  description = "Tags of public subnets"
  type        = map(string)
  default     = {}
}

variable "public_subnets" {
  type = list(map(any))

}

variable "natgw_name" {
  description = "NAT Gateway Name"
  type        = string
}

variable "natgw_tags" {
  description = "NAT Gateway tags"
  type        = map(string)
  default     = {}
}

variable "igw_name" {
  description = "Name of Interget Gateway"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(any)
  default     = {}
}