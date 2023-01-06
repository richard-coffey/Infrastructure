param staticSites_static_web_app_name string = 'static-web-app'
param location string = 'West Europe'
param customName string = 'cv.richardcoffey.com'
param repoUrl string = 'https://coffeyrichard.visualstudio.com/Azure Serverless CV/_git/Static Web App'

resource staticSites_static_web_app_name_resource 'Microsoft.Web/staticSites@2022-03-01' = {
  name: staticSites_static_web_app_name
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: repoUrl
    branch: 'main'
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
    provider: 'Custom'
    enterpriseGradeCdnStatus: 'Disabled'
  }
}

resource staticSites_static_web_app_name_cv_richardcoffey_com 'Microsoft.Web/staticSites/customDomains@2022-03-01' = {
  parent: staticSites_static_web_app_name_resource
  name: customName
  location: location
  properties: {
  }
}
