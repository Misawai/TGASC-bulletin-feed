#!/usr/bin/env bash
# broadcast.sh
# Broadcast fetched bulletin to chatbot users.

set -e

if [ "$(<./status)" == "true" ]; then
	echo "exit"
	exit 0;
fi

curl -v -X POST https://api.line.me/v2/bot/message/broadcast \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer ${{ secrets.LINE_OFFICIAL_ACCOUNT_CHANNEL_ACCESS_TOKEN }}' \
-d '{
	"messages":[
		{
           "type":"text",
		   "text":"$(<./message.txt)"
		}
	]
}'