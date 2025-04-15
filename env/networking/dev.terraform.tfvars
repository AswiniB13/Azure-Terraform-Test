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
    address_space       = ["10.0.0.0/16"]
    subnets = [
      {
        subnetName             = "subnet1"  
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        subnetName             = "subnet2"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
    tags = {
      environment = "Development"
      owner       = "Team A"
    }
  }
}

# subscription_id = "52b0dxxxxxx-xxxx--xxxx--xxx"
