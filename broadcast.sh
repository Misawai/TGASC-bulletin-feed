#!/usr/bin/env bash
# broadcast.sh
# Broadcast fetched bulletin to chatbot users.

set -e


if [ "$(<./status)" == "true" ]; then
	echo "exit"
	exit 0;
fi

if [ -z "$1" ]; then
  echo "Access token is missing!"
  exit 1
fi

ls

MESSAGE=$(<./message.txt)
JSON=$(jq -n \
  --arg text "$MESSAGE" \
  '{
    messages: [
      {
        type: "text",
        text: $text
      },
	  {
		type: "text",
		text: "test"
	  }
    ]
  }')
  
echo "MESSAGE content: [$MESSAGE]"


curl -v -X POST https://api.line.me/v2/bot/message/broadcast \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $1 " \
-d "$JSON"