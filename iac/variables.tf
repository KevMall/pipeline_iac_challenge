variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "subscription_id" {
  description = "ID of the target subscription"
  type        = string
}

variable "location" {
  description = "Location for the Azure resources"
  type = string
  default = "UK South"
}