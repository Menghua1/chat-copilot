#!/bin/bash
 
# Add web url to frontend app registration.
 
if ($env:AZURE_FRONTEND_APPLICATION_ID -ne '') {
  OBJECT_ID=$(az ad app show --id $env:AZURE_FRONTEND_APPLICATION_ID | jq -r '.id')
  BODY="{spa:{redirectUris:['$env:REACT_APP_WEB_BASE_URL']}}"
 
  echo "Updating redirect with $BODY"
 
  az rest --method PATCH --uri "https://graph.microsoft.com/v1.0/applications/$OBJECT_ID" --headers 'Content-Type=application/json' --body $BODY
}