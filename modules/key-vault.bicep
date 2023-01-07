param vaults_azure_serverless_cv_name string = 'azure-serverless-cv'
param vaults_azure_serverless_cv_location string = 'North Europe'

resource vaults_azure_serverless_cv_name_resource 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: vaults_azure_serverless_cv_name
  location: vaults_azure_serverless_cv_location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '91bd449c-7ee8-4dd3-84f3-eedb77fc18db'
    accessPolicies: [
      {
        tenantId: '91bd449c-7ee8-4dd3-84f3-eedb77fc18db'
        objectId: '7bc523f1-6074-4188-86f4-17c13b51b8e2'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '91bd449c-7ee8-4dd3-84f3-eedb77fc18db'
        objectId: '1f6e2164-e400-4907-9fbf-a68270a636dc'
        permissions: {
          certificates: []
          keys: []
          secrets: [
            'get'
            'list'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    vaultUri: 'https://${vaults_azure_serverless_cv_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource vaults_azure_serverless_cv_name_BlobContainerConnectionString 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: vaults_azure_serverless_cv_name_resource
  name: 'BlobContainerConnectionString'
  location: vaults_azure_serverless_cv_location
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_azure_serverless_cv_name_DatabaseConnectionString 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: vaults_azure_serverless_cv_name_resource
  name: 'DatabaseConnectionString'
  location: vaults_azure_serverless_cv_location
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_azure_serverless_cv_name_SendGridApiKey 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: vaults_azure_serverless_cv_name_resource
  name: 'SendGridApiKey'
  location: vaults_azure_serverless_cv_location
  properties: {
    attributes: {
      enabled: true
    }
  }
}
