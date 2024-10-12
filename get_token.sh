#!/bin/bash
APPLICATION_ID=b0f1b774-a586-4f72-9edd-27ead8aa7a8d
curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "applicationId:$APPLICATION_ID" \
    -d "{\"username\":\"$1\",\"password\":\"$2\"}" \
    https://api.glowmarkt.com/api/v0-1/auth | jq | tee token.json
