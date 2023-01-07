param location string = 'West Europe'

module StaticWebApp 'modules/static-web-app.bicep' = {
  name: 'static-web-app'
  params: {
    location: location
  }
}

module AzureFunctions 'modules/azure-functions.bicep' = {
  name: 'azure-functions'
  dependsOn: [
    AppServicePlan
  ]
}

module CosmosDb 'modules/cosmosdb.bicep' = {
  name: 'cosmosdb'
}

module KeyVault 'modules/key-vault.bicep' = {
  name: 'key-vault'
}

module APIManagment 'modules/api-managment.bicep' = {
  name: 'api-managment'
}

module StorageAccount 'modules/storage-account.bicep' = {
  name: 'storage-account'
}

module AppInsights 'modules/app-insights.bicep' = {
  name: 'app-insights'
}

module AppServicePlan 'modules/app-service-plan.bicep' = {
  name: 'app-service-plan'
}
