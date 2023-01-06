param location string = resourceGroup().location

module StaticWebApp 'modules/static-web-app.bicep' = {
  name: 'Static Web App'
  params: {
    location: location
  }
}
