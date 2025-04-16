#!/usr/bin/env bash
# broadcast.sh
# Broadcast fetched bulletin to chatbot users.

set -e

echo "Checking status code in cache."
if [ "$(<./status)" != "200" ]; then
	echo "Status code not 200, exit."
	exit 0;
else 
	echo "Status code is 200!";
fi

echo "Checking if access token provided."
if [ -z "$1" ]; then
  echo "Access token is missing!"
  exit 1
else 
	echo "There is a access token.";
fi

echo "Reading message body."
input=$(<./message.txt)

echo "Reading message footer remaining."
footer="Line 官方帳號提供)"

echo "Combine message body and footer remaining."
MESSAGE="${input} ${footer}"

echo "Creating JSON via jq."
LINEJSON=$(jq -n \
  --arg text "$MESSAGE" \
  '{
    messages: [
      {
        type: "text",
        text: $text
      }
    ]
  }')

echo "Sending message to Line API."
echo "${MESSAGE}" >test.txt
curl -v -X POST https://api.line.me/v2/bot/message/broadcast \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $1 " \
-d "${LINEJSON}"