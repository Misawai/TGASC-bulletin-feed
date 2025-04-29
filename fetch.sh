#!/usr/bin/env bash
# fetch.sh
# Fetch bulletin of TGASC.

set -e

echo "Checking status code in cache." 
if [ "$(<./status)" != "200" ]; then
	echo "Status code not 200, exit."
	exit 0;
else 
	echo "Status code is 200!";
fi

# read the latest bulletin
echo "Reading the latest bulletin issue number."
latest=$(<./latest)
((latest--))# The previous one is the latest article.

# get the latest paragraph
echo "Connecting to https://www.scout.org.tw/news_detail/${latest}..."
curl -s https://www.scout.org.tw/news_detail/"${latest}" >temp.txt 

# read title
echo "Reading title."
<./temp.txt htmlq -t h1 | tr -d '\n''\t' >message.txt

# add new line after reading title
echo "Adding a new line after title."
sed -i "1a\\" message.txt

# conditional statement for distinguishing if the new bulletin is a pure article or not
if [ -z "$(<./temp.txt htmlq article | htmlq -r div.column.full -t | tr -d '\n''\t')" ]; then \
# if after remove div.column.full still have any character, consider as pure article, without links
	echo "It's a message without button."
	<./temp.txt htmlq article -p -t| tr -s '\n''\t' >>message.txt
	echo "Message processed."
	exit 0;# exit successfully
else 
	echo "It's a message with button."	
	<./temp.txt htmlq article | htmlq -r div.column.full -t | tr -s '\n''\t' | sed '1{/^[[:space:]]*$/d}; ${/^[[:space:]]*$/d}; s/^[[:space:]]*//; s/[[:space:]]*$//' >>message.txt
	echo "Message processed.";
fi

# prepeare for print out links
echo "Prepearing for printing out links."
<./temp.txt htmlq article | htmlq div.column.full >temp2.txt

# add new line for prettify
echo "Add a new line into message bodytext for prettify."
sed -i -e '$a\' message.txt

# append links at the end of message
paste <(htmlq -t a <./temp2.txt) <(htmlq -a href a <./temp2.txt) >>message.txt
echo "Links combined."

# add new line for prettify
echo "Add a new line into message bodytext for prettify."
sed -i -e '$a\' message.txt

echo "Adding footer."
echo -e "------\n童軍總會官網公告連結: https://www.scout.org.tw/news_detail/${latest}\n(本訊息擷自中華民國童軍總會官網，並由「8 乎你知——童軍總會官網公告非官方推播」" >>message.txt
