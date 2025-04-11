#### RG  ##########
resource_groups = {
  "rg-dev-01" = {
    location = "East US"
    tags = {
      environment = "Development"
      owner       = "Team A"
    }
  }
}

#### Vnet #####
vnets = {
  "vnet1" = {
    location            = "East US"
    resource_group_name = "rg-dev-01"
    address_space       = ["1x.x.x.x/16"]
    subnets = [
      {
        subnetName             = "subnet1"  
        address_prefixes = ["xx.x.x.x/24"]
      },
      {
        subnetName             = "subnet2"
        address_prefixes = ["1x.x.x.x/24"]
      }
    ]
    tags = {
      environment = "Development"
      owner       = "Team A"
    }
  }
}

subscription_id = "52b0dxxxxxx-xxxx--xxxx--xxx"
