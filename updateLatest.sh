#!/usr/bin/env bash
# updateLatest.sh
# Keep the latest bulletin number up to date.

set -e

# read the latest bulletin
latestnum=$(<./latest)

statusCode=$(curl -s -I https://www.scout.org.tw/news_detail/${latestnum} | grep "^HTTP\/" | awk '{print $2}')

if [ "$statusCode" == "404" ]; then
	echo "Have reached to the latest bulletin."
	echo "true" >status
	exit 0;
else 
	((latestnum++))
	echo "$latestnum" >./latest
	echo "false" >status;
fi