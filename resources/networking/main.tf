### Creating Resource Group ##########
module "resource_groups" {
  source = "github.com/AswiniB13/Azure-Terraform-Test//modules/resourcegroup/?ref=ab-feature-branch"
  
  for_each = var.resource_groups
  rgname   = each.key
  location = each.value.location
  tags     = each.value.tags
}
