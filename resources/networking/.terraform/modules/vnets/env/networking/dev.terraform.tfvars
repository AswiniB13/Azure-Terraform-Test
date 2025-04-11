resource_groups = {
  "rg-dev" = {
    location = "East US"
    tags = {
      environment = "Development"
      owner       = "Team A"
    }
  }
  "rg-prod" = {
    location = "West US"
    tags = {
      environment = "Production"
      owner       = "Team B"
    }
  }
}
