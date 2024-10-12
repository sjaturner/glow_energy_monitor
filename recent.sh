#!/bin/bash
APPLICATION_ID=b0f1b774-a586-4f72-9edd-27ead8aa7a8d

days=2
epoch=$(date +%s) 
from=$(date -d @$(( $epoch - $days * 24 * 3600)) --iso-8601=seconds | sed 's/:.*/:00:00/')
to=$(date -d @$(( $epoch + 3600)) --iso-8601=seconds | sed 's/:.*/:59:59/')
resource_id=$(cat resource.json | jq -r ".[] | select(.classifier==\"$1\") | .resourceId")

if [ -z $resource_id ] ; then
    echo argument must be electricity.consumption or gas.consumption
fi

curl -s -X GET \
    -H "Content-Type: application/json" \
    -H "token:$(jq -r '.token' < token.json)" \
    -H "applicationId:$APPLICATION_ID" \
    "https://api.glowmarkt.com/api/v0-1/resource/$resource_id/readings?from=$from&to=$to&period=PT30M&function=sum" \
    | jq -r '.data[] | @tsv'
