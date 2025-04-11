### Creating Resource Group ##########
module "resource_groups" {
  source = "../../"
  
  for_each = var.resource_groups
  rgname   = each.key
  location = each.value.location
  tags     = each.value.tags
}
