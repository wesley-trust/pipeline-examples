using './base.bicep'

// Common
param tags = {
  environment: '#{{ environment }}'
  owner: '#{{ owner }}'
  service: '#{{ service }}'
}

// Managed Identity
param name = 'id-#{{ service }}-#{{ environment }}-#{{ regionCode }}-#{{ idInstanceVersion }}'
