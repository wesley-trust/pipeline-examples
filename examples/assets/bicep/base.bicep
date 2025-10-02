targetScope = 'resourceGroup'

// Common
@description('Azure region for the virtual network. Defaults to the current resource group location.')
param location string = resourceGroup().location

@description('Optional tags applied to the resources.')
param tags object = {}
var normalizedTags = empty(tags) ? null : tags

// Managed Identity
@description('Name of the managed identity.')
param name string

module identity 'br/public:avm/res/managed-identity/user-assigned-identity:0.4.1' = {
  params: {
    name: name
    location: location
  }
}

// Test second
module identity_second 'br/public:avm/res/managed-identity/user-assigned-identity:0.4.1' = {
  params: {
    name: '${name}_second'
    location: location
  }
}
