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
	echo "The current issue ID in cache now is #${latestnum}."
	exit 0;
elif [ "$statusCode" == "404" ]; then
	echo "Returned ${statusCode}. May have reached to the latest bulletin issue."
	
	# Forward probe: check if any bulletin exists within the next PROBE_RANGE numbers
	echo "Starting forward probe to find next bulletin..."
	PROBE_RANGE=50
	for ((i=1; i<=PROBE_RANGE; i++)); do
		probeNum=$((latestnum + i))
		probeStatus=$(curl -s -I https://www.scout.org.tw/news_detail/"${probeNum}" | grep "^HTTP\/" | awk '{print $2}')
		
		if [ "${probeStatus}" == "200" ]; then
			echo "Found bulletin #${probeNum} exists!"
			echo "$((probeNum + 1))" >./latest
			echo "200" >status
			echo "The current issue ID in cache now is #$((probeNum + 1))."
			exit 0
		fi
	done
	
	echo "No new bulletin found within probe range of ${PROBE_RANGE}."
	echo "404" >status
	exit 0;
else 
	echo "Returned ${statusCode}, which is neither 200 nor 404. Please conduct further check."
	echo "${statusCode}" >status
	exit 1;
fi