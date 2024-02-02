#!/bin/bash
 
  OBJECT_ID=$(az ad app show --id ${frontendClientId} | jq -r '.id')
  BODY="{spa:{redirectUris:['${webUrl}']}}"
  az login
  az rest --method PATCH --uri "https://graph.microsoft.com/v1.0/applications/$OBJECT_ID" --headers 'Content-Type=application/json' --body $BODY