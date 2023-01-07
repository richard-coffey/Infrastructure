param storageAccounts_azureserverlesscv_name string = 'azureserverlesscv'

resource storageAccounts_azureserverlesscv_name_resource 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccounts_azureserverlesscv_name
  location: 'northeurope'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource storageAccounts_azureserverlesscv_name_default 'Microsoft.Storage/storageAccounts/blobServices@2022-05-01' = {
  parent: storageAccounts_azureserverlesscv_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    changeFeed: {
      enabled: false
    }
    restorePolicy: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
    isVersioningEnabled: false
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_azureserverlesscv_name_default 'Microsoft.Storage/storageAccounts/fileServices@2022-05-01' = {
  parent: storageAccounts_azureserverlesscv_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {
      }
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_azureserverlesscv_name_default 'Microsoft.Storage/storageAccounts/queueServices@2022-05-01' = {
  parent: storageAccounts_azureserverlesscv_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_azureserverlesscv_name_default 'Microsoft.Storage/storageAccounts/tableServices@2022-05-01' = {
  parent: storageAccounts_azureserverlesscv_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource storageAccounts_azureserverlesscv_name_default_cv_pdf 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = {
  parent: storageAccounts_azureserverlesscv_name_default
  name: 'cv-pdf'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [

    storageAccounts_azureserverlesscv_name_resource
  ]
}

resource storageAccounts_azureserverlesscv_name_default_site_counter 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = {
  parent: storageAccounts_azureserverlesscv_name_default
  name: 'site-counter'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'Container'
  }
  dependsOn: [

    storageAccounts_azureserverlesscv_name_resource
  ]
}

resource storageAccounts_azureserverlesscv_name_default_form_submission 'Microsoft.Storage/storageAccounts/queueServices/queues@2022-05-01' = {
  parent: Microsoft_Storage_storageAccounts_queueServices_storageAccounts_azureserverlesscv_name_default
  name: 'form-submission'
  properties: {
    metadata: {
    }
  }
  dependsOn: [

    storageAccounts_azureserverlesscv_name_resource
  ]
}

resource storageAccounts_azureserverlesscv_name_default_form_submission_poison 'Microsoft.Storage/storageAccounts/queueServices/queues@2022-05-01' = {
  parent: Microsoft_Storage_storageAccounts_queueServices_storageAccounts_azureserverlesscv_name_default
  name: 'form-submission-poison'
  properties: {
    metadata: {
    }
  }
  dependsOn: [

    storageAccounts_azureserverlesscv_name_resource
  ]
}
