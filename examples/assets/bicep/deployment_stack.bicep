targetScope = 'subscription'

param location string
param resourceGroup string

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
