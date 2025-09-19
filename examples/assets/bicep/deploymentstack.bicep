resource deploymentStack 'Microsoft.Resources/deploymentStacks@2023-11-01' = {
  name: 'example-deployment-stack'
  location: 'westeurope'
  properties: {
    actionOnUnmanage: 'detachAll' // or 'deleteResources'
    denySettings: {
      applyToChildScopes: false
      denyDelete: true
    }
  }
}
