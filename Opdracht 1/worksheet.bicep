var functionName = ''

resource functionStorageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: '${functionName}stor'
  kind: 'StorageV2'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
    accessTier: 'Hot'
    networkAcls: {
      defaultAction: 'Allow'
    }
  }

  resource fileServices 'fileServices' = {
    name: 'default'

    resource files 'shares' = {
      name: 'files'
    }
  }
}
