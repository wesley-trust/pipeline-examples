param name string
param location string = resourceGroup().location

module identity 'br/public:avm/res/managed-identity/user-assigned-identity:0.4.1' = {
  params: {
    name: name
    location: location
  }
}
