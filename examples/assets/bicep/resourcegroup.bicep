targetScope = 'subscription'

param location string = 'westeurope'
param resourceGroupName string = 'rg-app-dev-weu-001'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}
