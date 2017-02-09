#!/bin/bash
######################## Variables ########################
SERVER_NAME=" "
WIDGET_KEY=" "
###################### Do Not Modiy ######################
source /root/etc/api_keys

# Search UptimeRobot and build json
SERVER_STATUS=`curl -s -X POST https://api.uptimerobot.com/v2/getMonitors -H "Content-Type: application/x-www-form-urlencoded" -H "Cache-Control: no-cache" -d "api_key=$UP_API_KEY&format=json&response_times=1&response_times_limit=1&search=$SERVER_NAME" | jq '.monitors[] | {api_key: "'$GB_API_KEY'", "data":{status: (if .status == 2 then "Up" elif .status >= 8 then "Down" else "Unreported" end), responseTime: (.response_times[].value | tostring)}}'`

# POST json to Geckoboard
curl -s -X POST https://push.geckoboard.com/v1/send/$WIDGET_KEY -H "Content-Type:application/json" -d "$SERVER_STATUS"

exit 0
