param serverfarms_ASP_azureserverlesscv_8ee5_name string = 'ASP-azureserverlesscv-8ee5'

resource serverfarms_ASP_azureserverlesscv_8ee5_name_resource 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: serverfarms_ASP_azureserverlesscv_8ee5_name
  location: 'North Europe'
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
    size: 'Y1'
    family: 'Y'
    capacity: 0
  }
  kind: 'functionapp'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
}
