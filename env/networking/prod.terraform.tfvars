#### RG  ##########
resource_groups = {
  "rg-prod-01" = {
    location = "East US"
    tags = {
      environment = "Production"
      owner       = "Team A"
    }
  }
}

#### Vnet #####
vnets = {
  "vnet1" = {
    location            = "East US"
    resource_group_name = "rg-prod-01"
    address_space       = ["10x.x.x.x/16"]
    subnets = [
      {
        subnetName             = "subnet1"  
        address_prefixes = ["xx.x.x.x/24"]
      },
      {
        subnetName             = "subnet2"
        address_prefixes = ["10.0.x.x/xx"]
      }
    ]
    tags = {
      environment = "prodelopment"
      owner       = "Team A"
    }
  }
}

subscription_id = "xxxxx-xxxxxx-xxxx-x-x56789"
