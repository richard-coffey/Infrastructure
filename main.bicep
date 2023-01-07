param location string = resourceGroup().location

module StaticWebApp 'modules/static-web-app.bicep' = {
  name: 'static-web-app'
  params: {
    location: location
  }
}
