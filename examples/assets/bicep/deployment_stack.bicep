targetScope = 'subscription'

param location string = 'westeurope'
param resourceGroup string = 'rg-app-dev-weu-001'

resource deploymentStack 'Microsoft.Resources/deploymentStacks@2024-03-01' = {
  name: resourceGroup
  location: location
  properties: {
    actionOnUnmanage: {
      managementGroups: 'detach'
      resourceGroups: 'detach'
      resources: 'detach'
    }
    denySettings: {
      applyToChildScopes: false
      mode: 'denyDelete'
    }
  }
}
