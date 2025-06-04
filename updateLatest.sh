#!/usr/bin/env bash
# updateLatest.sh
# Keep the latest bulletin number up to date.

set -e

echo "Reading ./latest."
# read the latest bulletin
latestnum=$(<./latest)

echo "The latest issue ID in cache is #${latestnum}."

echo "Connecting to https://www.scout.org.tw/news_detail/${latestnum} ."
statusCode=$(curl -s -I https://www.scout.org.tw/news_detail/"${latestnum}" | grep "^HTTP\/" | awk '{print $2}')

if [ "${statusCode}" == "200" ]; then
	((latestnum++))
	echo "Returned ${statusCode}. Found page exists."
	echo "${latestnum}" >./latest
	echo "${statusCode}" >status
	echo "The current issue ID in cache now is #${latestnum}"
	exit 0;
elif [ "$statusCode" == "404" ]; then
	echo "Returned ${statusCode}. May have reached to the latest bulletin issue."
	echo "${statusCode}" >status
	exit 0;
else 
	echo "Returned ${statusCode}, which is neither 200 nor 404. Please conduct further check."
	echo "${statusCode}" >status
	exit 1;
fi