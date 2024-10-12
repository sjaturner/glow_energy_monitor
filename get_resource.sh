#!/bin/bash
APPLICATION_ID=b0f1b774-a586-4f72-9edd-27ead8aa7a8d

if [ ! -e "./token.json" ]; then 
    echo "run ./get_token.sh username password" 
    exit
fi

curl -s -X GET \
    -H "Content-Type: application/json" \
    -H "token:$(jq -r '.token' < token.json)" \
    -H "applicationId:$APPLICATION_ID" \
    https://api.glowmarkt.com/api/v0-1/resource | jq | tee resource.json
