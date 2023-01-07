param location string = 'West Europe'

module StaticWebApp 'modules/static-web-app.bicep' = {
  name: 'static-web-app'
  params: {
    location: location
  }
}

module AzureFunctions 'modules/azure-functions.bicep' = {
  name: 'azure-functions'
}
