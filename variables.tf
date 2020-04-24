# resource group settings
variable resource_group_name {
    default = "learn-k8s"
}

variable location {
    default = "japaneast"
}

# k8s cluster settings
variable cluster_name {
    default = "learnK8s"
}

variable "dns_prefix" {
    default = "learnK8scluster1"
}

variable "tag_use" {
    default = "self-learning"
}

# k8s cluster settings (node)
variable "agent_count" {
    default = 3
}

variable "node_vm_size" {
    default = "Standard_DS1_v2"
}

# acr settings
variable "acr_name" {
    default = "learnK8sAcr"
}

variable "acr_geo" {
    default = ["japaneast", "japanwest"]
}

variable "acr_sku" {
    default = "Premium"
}