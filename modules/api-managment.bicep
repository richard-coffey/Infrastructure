param service_api_managment_azure_serverless_cv_name string = 'api-managment-azure-serverless-cv'
param components_azure_serverless_cv_externalid string = '/subscriptions/51481efe-772a-49e5-a013-9e3001e18be8/resourceGroups/azure-serverless-cv/providers/microsoft.insights/components/azure-serverless-cv'
param service_api_managment_azure_serverless_cv_location string = 'North Europe'
param service_api_managment_azure_serverless_cv_publisher_email string = 'contact@richardcoffey.com'
param service_api_managment_azure_serverless_cv_publisher_name string = 'azure-serverless-cv'

resource service_api_managment_azure_serverless_cv_name_resource 'Microsoft.ApiManagement/service@2022-04-01-preview' = {
  name: service_api_managment_azure_serverless_cv_name
  location: 'North Europe'
  sku: {
    name: 'Consumption'
    capacity: 0
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publisherEmail: service_api_managment_azure_serverless_cv_publisher_email
    publisherName: service_api_managment_azure_serverless_cv_publisher_name
    notificationSenderEmail: 'apimgmt-noreply@mail.windowsazure.com'
    hostnameConfigurations: [
      {
        type: 'Proxy'
        hostName: '${service_api_managment_azure_serverless_cv_name}.azure-api.net'
        negotiateClientCertificate: false
        defaultSslBinding: true
        certificateSource: 'BuiltIn'
      }
    ]
    customProperties: {
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'false'
    }
    virtualNetworkType: 'None'
    disableGateway: false
    natGatewayState: 'Disabled'
    apiVersionConstraint: {
    }
    publicNetworkAccess: 'Enabled'
  }
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_form_submission 'Microsoft.ApiManagement/service/apis@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'azure-serverless-cv-form-submission'
  properties: {
    displayName: 'azure-serverless-cv-form-submission'
    apiRevision: '1'
    description: 'Import from "azure-serverless-cv" Function App'
    subscriptionRequired: false
    path: 'azure-serverless-cv-form-submission'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter 'Microsoft.ApiManagement/service/apis@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'azure-serverless-cv-site-counter'
  properties: {
    displayName: 'azure-serverless-cv-site-counter'
    apiRevision: '1'
    description: 'Import from "azure-serverless-cv" Function App'
    subscriptionRequired: true
    path: 'azure-serverless-cv-site-counter'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_value 'Microsoft.ApiManagement/service/apis@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'azure-serverless-cv-site-counter-value'
  properties: {
    displayName: 'azure-serverless-cv-site-counter-value'
    apiRevision: '1'
    description: 'Import from "azure-serverless-cv" Function App'
    subscriptionRequired: false
    path: 'azure-serverless-cv-site-counter-value'
    protocols: [
      'https'
    ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    isCurrent: true
  }
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv 'Microsoft.ApiManagement/service/backends@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'azure-serverless-cv'
  properties: {
    description: 'azure-serverless-cv'
    url: 'https://azure-serverless-cv.azurewebsites.net/api'
    protocol: 'http'
    resourceId: 'https://management.azure.com/subscriptions/51481efe-772a-49e5-a013-9e3001e18be8/resourceGroups/azure-serverless-cv/providers/Microsoft.Web/sites/azure-serverless-cv'
    credentials: {
      header: {
        'x-functions-key': [
          '{{azure-serverless-cv-key}}'
        ]
      }
    }
  }
}

resource Microsoft_ApiManagement_service_loggers_service_api_managment_azure_serverless_cv_name_azure_serverless_cv 'Microsoft.ApiManagement/service/loggers@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'azure-serverless-cv'
  properties: {
    loggerType: 'applicationInsights'
    credentials: {
      instrumentationKey: '{{Logger-Credentials--63b734ce360c3623d8c8773d}}'
    }
    isBuffered: true
    resourceId: components_azure_serverless_cv_externalid
  }
}

resource service_api_managment_azure_serverless_cv_name_63b734ce360c3623d8c8773c 'Microsoft.ApiManagement/service/namedValues@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: '63b734ce360c3623d8c8773c'
  properties: {
    displayName: 'Logger-Credentials--63b734ce360c3623d8c8773d'
    secret: true
  }
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_key 'Microsoft.ApiManagement/service/namedValues@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'azure-serverless-cv-key'
  properties: {
    displayName: 'azure-serverless-cv-key'
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource service_api_managment_azure_serverless_cv_name_policy 'Microsoft.ApiManagement/service/policies@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - Only the <forward-request> policy element can appear within the <backend> section element.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <cors allow-credentials="false">\r\n      <allowed-origins>\r\n        <origin>*</origin>\r\n      </allowed-origins>\r\n      <allowed-methods>\r\n        <method>GET</method>\r\n        <method>POST</method>\r\n      </allowed-methods>\r\n      <allowed-headers>\r\n        <header>*</header>\r\n      </allowed-headers>\r\n    </cors>\r\n  </inbound>\r\n  <backend>\r\n    <forward-request />\r\n  </backend>\r\n  <outbound />\r\n  <on-error />\r\n</policies>'
    format: 'xml'
  }
}

resource service_api_managment_azure_serverless_cv_name_Unlimited 'Microsoft.ApiManagement/service/products@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'Unlimited'
  properties: {
    displayName: 'Unlimited Access'
    description: 'Unlimited Access to API'
    subscriptionRequired: false
    state: 'published'
  }
}

resource Microsoft_ApiManagement_service_properties_service_api_managment_azure_serverless_cv_name_63b734ce360c3623d8c8773c 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: '63b734ce360c3623d8c8773c'
  properties: {
    displayName: 'Logger-Credentials--63b734ce360c3623d8c8773d'
    value: 'f31b843f-44be-4ccf-9398-a58c9821761a'
    secret: true
  }
}

resource Microsoft_ApiManagement_service_properties_service_api_managment_azure_serverless_cv_name_azure_serverless_cv_key 'Microsoft.ApiManagement/service/properties@2019-01-01' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'azure-serverless-cv-key'
  properties: {
    displayName: 'azure-serverless-cv-key'
    value: 'z3KKVbxTDkfCmz2Y9CnQm7WSkFcBlGWm42YKQ51wHXPCl+wxdoFflA=='
    tags: [
      'key'
      'function'
      'auto'
    ]
    secret: true
  }
}

resource service_api_managment_azure_serverless_cv_name_master 'Microsoft.ApiManagement/service/subscriptions@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'master'
  properties: {
    scope: '${service_api_managment_azure_serverless_cv_name_resource.id}/'
    displayName: 'Built-in all-access subscription'
    state: 'active'
    allowTracing: true
  }
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_get_sitecounterfunction 'Microsoft.ApiManagement/service/apis/operations@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter
  name: 'get-sitecounterfunction'
  properties: {
    displayName: 'SiteCounterFunction'
    method: 'GET'
    urlTemplate: '/SiteCounterFunction'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_value_get_sitecountervaluefunction 'Microsoft.ApiManagement/service/apis/operations@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_value
  name: 'get-sitecountervaluefunction'
  properties: {
    displayName: 'SiteCounterValueFunction'
    method: 'GET'
    urlTemplate: '/SiteCounterValueFunction'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_form_submission_post_formsubmissionfunction 'Microsoft.ApiManagement/service/apis/operations@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_form_submission
  name: 'post-formsubmissionfunction'
  properties: {
    displayName: 'FormSubmissionFunction'
    method: 'POST'
    urlTemplate: '/FormSubmissionFunction'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_post_sitecounterfunction 'Microsoft.ApiManagement/service/apis/operations@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter
  name: 'post-sitecounterfunction'
  properties: {
    displayName: 'SiteCounterFunction'
    method: 'POST'
    urlTemplate: '/SiteCounterFunction'
    templateParameters: []
    responses: []
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_value_policy 'Microsoft.ApiManagement/service/apis/policies@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_value
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <cache-lookup vary-by-developer="false" vary-by-developer-groups="false" allow-private-response-caching="false" must-revalidate="false" downstream-caching-type="none" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n    <cache-store duration="3600" />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_applicationinsights 'Microsoft.ApiManagement/service/diagnostics@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_resource
  name: 'applicationinsights'
  properties: {
    alwaysLog: 'allErrors'
    httpCorrelationProtocol: 'Legacy'
    logClientIp: true
    loggerId: Microsoft_ApiManagement_service_loggers_service_api_managment_azure_serverless_cv_name_azure_serverless_cv.id
    sampling: {
      samplingType: 'fixed'
      percentage: 100
    }
    frontend: {
      request: {
        dataMasking: {
          queryParams: [
            {
              value: '*'
              mode: 'Hide'
            }
          ]
        }
      }
    }
    backend: {
      request: {
        dataMasking: {
          queryParams: [
            {
              value: '*'
              mode: 'Hide'
            }
          ]
        }
      }
    }
  }
}

resource service_api_managment_azure_serverless_cv_name_applicationinsights_azure_serverless_cv 'Microsoft.ApiManagement/service/diagnostics/loggers@2018-01-01' = {
  parent: service_api_managment_azure_serverless_cv_name_applicationinsights
  name: 'azure-serverless-cv'
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_Unlimited_azure_serverless_cv_form_submission 'Microsoft.ApiManagement/service/products/apis@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_Unlimited
  name: 'azure-serverless-cv-form-submission'
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_Unlimited_azure_serverless_cv_site_counter 'Microsoft.ApiManagement/service/products/apis@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_Unlimited
  name: 'azure-serverless-cv-site-counter'
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_Unlimited_azure_serverless_cv_site_counter_value 'Microsoft.ApiManagement/service/products/apis@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_Unlimited
  name: 'azure-serverless-cv-site-counter-value'
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_form_submission_post_formsubmissionfunction_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_form_submission_post_formsubmissionfunction
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azure-serverless-cv" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_azure_serverless_cv_form_submission
    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_get_sitecounterfunction_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_get_sitecounterfunction
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azure-serverless-cv" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter
    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_post_sitecounterfunction_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_post_sitecounterfunction
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azure-serverless-cv" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter
    service_api_managment_azure_serverless_cv_name_resource
  ]
}

resource service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_value_get_sitecountervaluefunction_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2022-04-01-preview' = {
  parent: service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_value_get_sitecountervaluefunction
  name: 'policy'
  properties: {
    value: '<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service id="apim-generated-policy" backend-id="azure-serverless-cv" />\r\n    <cache-lookup vary-by-developer="false" vary-by-developer-groups="false" allow-private-response-caching="false" must-revalidate="false" downstream-caching-type="none" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n    <cache-store duration="3600" />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [

    service_api_managment_azure_serverless_cv_name_azure_serverless_cv_site_counter_value
    service_api_managment_azure_serverless_cv_name_resource
  ]
}
