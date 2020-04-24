resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix          = var.dns_prefix

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = var.node_vm_size
    }

    identity {
        type = "SystemAssigned"
    }

    tags = {
        Use = var.tag_use
    }
}

resource "azurerm_container_registry" "acr" {
    name                     = var.acr_name
    resource_group_name      = azurerm_resource_group.k8s.name
    location                 = azurerm_resource_group.k8s.location
    sku                      = var.acr_sku
    admin_enabled            = false
    georeplication_locations = var.acr_geo
}

resource "azurerm_role_assignment" "acrpull_role" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.k8s.identity[0].principal_id
}