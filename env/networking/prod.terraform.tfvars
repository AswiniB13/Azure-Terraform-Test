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
      environment = "prodelopment"
      owner       = "Team A"
    }
  }
}

subscription_id = "52b0d977-da36-47f2-a3f1-4225c823ee20"