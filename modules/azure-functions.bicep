param sites_azure_serverless_cv_name string = 'azure-serverless-cv'
param sites_azure_serverless_cv_location string = 'North Europe'
param serverfarms_ASP_azureserverlesscv_8ee5_externalid string = '/subscriptions/51481efe-772a-49e5-a013-9e3001e18be8/resourceGroups/azure-serverless-cv/providers/Microsoft.Web/serverfarms/ASP-azureserverlesscv-8ee5'

resource sites_azure_serverless_cv_name_resource 'Microsoft.Web/sites@2022-03-01' = {
  name: sites_azure_serverless_cv_name
  location: sites_azure_serverless_cv_location
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/51481efe-772a-49e5-a013-9e3001e18be8/resourceGroups/azure-serverless-cv/providers/microsoft.insights/components/azure-serverless-cv'
    'hidden-link: /app-insights-instrumentation-key': 'f31b843f-44be-4ccf-9398-a58c9821761a'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=f31b843f-44be-4ccf-9398-a58c9821761a;IngestionEndpoint=https://northeurope-2.in.applicationinsights.azure.com/;LiveEndpoint=https://northeurope.livediagnostics.monitor.azure.com/'
  }
  kind: 'functionapp'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_azure_serverless_cv_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_azure_serverless_cv_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_azureserverlesscv_8ee5_externalid
    reserved: false
    isXenon: false
    hyperV: false
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 200
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: '270D548EA7D88175683336D3CA10AE56F8A7592442C5622E1F656F61B2E49B19'
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_azure_serverless_cv_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'ftp'
  location: sites_azure_serverless_cv_location
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/51481efe-772a-49e5-a013-9e3001e18be8/resourceGroups/azure-serverless-cv/providers/microsoft.insights/components/azure-serverless-cv'
    'hidden-link: /app-insights-instrumentation-key': 'f31b843f-44be-4ccf-9398-a58c9821761a'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=f31b843f-44be-4ccf-9398-a58c9821761a;IngestionEndpoint=https://northeurope-2.in.applicationinsights.azure.com/;LiveEndpoint=https://northeurope.livediagnostics.monitor.azure.com/'
  }
  properties: {
    allow: true
  }
}

resource sites_azure_serverless_cv_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'scm'
  location: sites_azure_serverless_cv_location
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/51481efe-772a-49e5-a013-9e3001e18be8/resourceGroups/azure-serverless-cv/providers/microsoft.insights/components/azure-serverless-cv'
    'hidden-link: /app-insights-instrumentation-key': 'f31b843f-44be-4ccf-9398-a58c9821761a'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=f31b843f-44be-4ccf-9398-a58c9821761a;IngestionEndpoint=https://northeurope-2.in.applicationinsights.azure.com/;LiveEndpoint=https://northeurope.livediagnostics.monitor.azure.com/'
  }
  properties: {
    allow: true
  }
}

resource sites_azure_serverless_cv_name_web 'Microsoft.Web/sites/config@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'web'
  location: sites_azure_serverless_cv_location
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/51481efe-772a-49e5-a013-9e3001e18be8/resourceGroups/azure-serverless-cv/providers/microsoft.insights/components/azure-serverless-cv'
    'hidden-link: /app-insights-instrumentation-key': 'f31b843f-44be-4ccf-9398-a58c9821761a'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=f31b843f-44be-4ccf-9398-a58c9821761a;IngestionEndpoint=https://northeurope-2.in.applicationinsights.azure.com/;LiveEndpoint=https://northeurope.livediagnostics.monitor.azure.com/'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v6.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$azure-serverless-cv'
    scmType: 'VSTSRM'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    cors: {
      allowedOrigins: [
        'https://portal.azure.com'
      ]
      supportCredentials: false
    }
    localMySqlEnabled: false
    managedServiceIdentityId: 9293
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 200
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {
    }
  }
}

resource sites_azure_serverless_cv_name_0f731ba436fd4474914531a5b09f7ef1 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: '0f731ba436fd4474914531a5b09f7ef1'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"32313d63acbeb090fc2fd9dea91c654a933b5665","buildId":"332","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T20:35:19.6810454Z'
    end_time: '2023-01-04T20:35:21.0869573Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_396644d966ff45f7b880d8241db785c6 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: '396644d966ff45f7b880d8241db785c6'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"43ff748c0023692e831f4456a0485c9277a5269c","buildId":"331","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T19:33:55.2974121Z'
    end_time: '2023-01-04T19:33:56.7193755Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_4dc51ad228ef4ff7b1ca8f7e15bfedc3 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: '4dc51ad228ef4ff7b1ca8f7e15bfedc3'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"807f315dfbc8576d05c9258e909d80a6adca618a","buildId":"334","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T21:50:47.8197683Z'
    end_time: '2023-01-04T21:50:49.1478551Z'
    active: true
  }
}

resource sites_azure_serverless_cv_name_5be93ab2227b4cb6ad253a0fd2c53556 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: '5be93ab2227b4cb6ad253a0fd2c53556'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"4966231b8df33e3a4c1eadaeae2cb7b21418e552","buildId":"330","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T19:03:39.9440663Z'
    end_time: '2023-01-04T19:03:41.3972504Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_616fa0fcabf44e4289573b1c3284933f 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: '616fa0fcabf44e4289573b1c3284933f'
  location: 'North Europe'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"9d648eb92fbb97c389b45214d598d0fbbec49341","buildId":"324","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T13:03:52.4547787Z'
    end_time: '2023-01-04T13:03:54.0524508Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_69408543177c4c71a6974f891ef8bffa 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: '69408543177c4c71a6974f891ef8bffa'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"3fc93d539603dc300b8b51015adb834565c8a48d","buildId":"325","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T13:30:15.6078847Z'
    end_time: '2023-01-04T13:30:18.6648041Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_a004dcc46d6041f1b02024bfcdf8bfdd 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'a004dcc46d6041f1b02024bfcdf8bfdd'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"73fa3cb37d4ef12484d3740f289c3e29e6f59295","buildId":"333","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T20:47:03.6535763Z'
    end_time: '2023-01-04T20:47:05.1993551Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_babe86121155488a99076944c7ee0399 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'babe86121155488a99076944c7ee0399'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"6b8421f6ae74b8cfe4bc507fd8ff7d84e1671da1","buildId":"328","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T18:49:35.7622407Z'
    end_time: '2023-01-04T18:49:37.16873Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_cd5e564fc02145d79b2c3facd8b003df 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'cd5e564fc02145d79b2c3facd8b003df'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"8a010313bb995835e6f92d2e1678a5022a8a32fc","buildId":"326","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T13:35:24.8879616Z'
    end_time: '2023-01-04T13:35:26.4348806Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_e2e24c57863249eb9b7cad748486c3e7 'Microsoft.Web/sites/deployments@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'e2e24c57863249eb9b7cad748486c3e7'
  location: sites_azure_serverless_cv_location
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'VSTS_FUNCTIONS_V1'
    message: '{"type":"deployment","commitId":"8a010313bb995835e6f92d2e1678a5022a8a32fc","buildId":"327","buildNumber":"Azure Functions","repoProvider":"TfsGit","repoName":"Azure Functions","collectionUrl":"https://coffeyrichard.visualstudio.com/","teamProject":"1a566cd7-4f9e-45a9-a0b6-373183d6c806","buildProjectUrl":"https://coffeyrichard.visualstudio.com/1a566cd7-4f9e-45a9-a0b6-373183d6c806","repositoryUrl":"https://coffeyrichard.visualstudio.com/Azure%20Serverless%20CV/_git/Azure%20Functions","branch":"main","teamProjectName":"Azure Serverless CV","slotName":"production"}'
    start_time: '2023-01-04T13:42:44.3731651Z'
    end_time: '2023-01-04T13:42:46.0604574Z'
    active: false
  }
}

resource sites_azure_serverless_cv_name_FormSubmissionCosmosDbFunction 'Microsoft.Web/sites/functions@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'FormSubmissionCosmosDbFunction'
  location: sites_azure_serverless_cv_location
  properties: {
    script_root_path_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/FormSubmissionCosmosDbFunction/'
    script_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/bin/Azure Functions.dll'
    config_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/FormSubmissionCosmosDbFunction/function.json'
    test_data_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/data/Functions/sampledata/FormSubmissionCosmosDbFunction.dat'
    href: 'https://azure-serverless-cv.azurewebsites.net/admin/functions/FormSubmissionCosmosDbFunction'
    config: {
    }
    language: 'DotNetAssembly'
    isDisabled: false
  }
}

resource sites_azure_serverless_cv_name_FormSubmissionFunction 'Microsoft.Web/sites/functions@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'FormSubmissionFunction'
  location: sites_azure_serverless_cv_location
  properties: {
    script_root_path_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/FormSubmissionFunction/'
    script_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/bin/Azure Functions.dll'
    config_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/FormSubmissionFunction/function.json'
    test_data_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/data/Functions/sampledata/FormSubmissionFunction.dat'
    href: 'https://azure-serverless-cv.azurewebsites.net/admin/functions/FormSubmissionFunction'
    config: {
    }
    invoke_url_template: 'https://azure-serverless-cv.azurewebsites.net/api/formsubmissionfunction'
    language: 'DotNetAssembly'
    isDisabled: false
  }
}

resource sites_azure_serverless_cv_name_FormSubmissionSendGridFunction 'Microsoft.Web/sites/functions@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'FormSubmissionSendGridFunction'
  location: sites_azure_serverless_cv_location
  properties: {
    script_root_path_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/FormSubmissionSendGridFunction/'
    script_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/bin/Azure Functions.dll'
    config_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/FormSubmissionSendGridFunction/function.json'
    test_data_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/data/Functions/sampledata/FormSubmissionSendGridFunction.dat'
    href: 'https://azure-serverless-cv.azurewebsites.net/admin/functions/FormSubmissionSendGridFunction'
    config: {
    }
    language: 'DotNetAssembly'
    isDisabled: false
  }
}

resource sites_azure_serverless_cv_name_SiteCounterCosmosDbFunction 'Microsoft.Web/sites/functions@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'SiteCounterCosmosDbFunction'
  location: sites_azure_serverless_cv_location
  properties: {
    script_root_path_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/SiteCounterCosmosDbFunction/'
    script_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/bin/Azure Functions.dll'
    config_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/SiteCounterCosmosDbFunction/function.json'
    test_data_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/data/Functions/sampledata/SiteCounterCosmosDbFunction.dat'
    href: 'https://azure-serverless-cv.azurewebsites.net/admin/functions/SiteCounterCosmosDbFunction'
    config: {
    }
    language: 'DotNetAssembly'
    isDisabled: false
  }
}

resource sites_azure_serverless_cv_name_SiteCounterFunction 'Microsoft.Web/sites/functions@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'SiteCounterFunction'
  location: sites_azure_serverless_cv_location
  properties: {
    script_root_path_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/SiteCounterFunction/'
    script_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/bin/Azure Functions.dll'
    config_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/SiteCounterFunction/function.json'
    test_data_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/data/Functions/sampledata/SiteCounterFunction.dat'
    href: 'https://azure-serverless-cv.azurewebsites.net/admin/functions/SiteCounterFunction'
    config: {
    }
    invoke_url_template: 'https://azure-serverless-cv.azurewebsites.net/api/sitecounterfunction'
    language: 'DotNetAssembly'
    isDisabled: false
  }
}

resource sites_azure_serverless_cv_name_SiteCounterValueFunction 'Microsoft.Web/sites/functions@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: 'SiteCounterValueFunction'
  location: sites_azure_serverless_cv_location
  properties: {
    script_root_path_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/SiteCounterValueFunction/'
    script_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/bin/Azure Functions.dll'
    config_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/site/wwwroot/SiteCounterValueFunction/function.json'
    test_data_href: 'https://azure-serverless-cv.azurewebsites.net/admin/vfs/data/Functions/sampledata/SiteCounterValueFunction.dat'
    href: 'https://azure-serverless-cv.azurewebsites.net/admin/functions/SiteCounterValueFunction'
    config: {
    }
    invoke_url_template: 'https://azure-serverless-cv.azurewebsites.net/api/sitecountervaluefunction'
    language: 'DotNetAssembly'
    isDisabled: false
  }
}

resource sites_azure_serverless_cv_name_sites_azure_serverless_cv_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2022-03-01' = {
  parent: sites_azure_serverless_cv_name_resource
  name: '${sites_azure_serverless_cv_name}.azurewebsites.net'
  location: sites_azure_serverless_cv_location
  properties: {
    siteName: 'azure-serverless-cv'
    hostNameType: 'Verified'
  }
}
