#!/usr/bin/env bash
# fetch.sh
# Fetch bulletin of TGASC.

set -e

if [ "$(<./status)" == "true" ]; then
	echo "exit"
	exit 0;
fi


# read the latest bulletin
latest=$(<./latest)

# get the latest paragraph
curl -s https://www.scout.org.tw/news_detail/${latest} >temp.txt 

# read title
<./temp.txt htmlq -t h1 | tr -d '\n''\t' >message.txt

# add new line after reading title
sed -i "1a\\" message.txt

# conditional statement for distinguishing if the new bulletin is a pure article or not
if [ -z "$(<./temp.txt htmlq article | htmlq -r div.column.full -t | tr -d '\n''\t')" ]; then \
# if after remove div.column.full still have any character, consider as pure article, without links
	<./temp.txt htmlq article -p -t| tr -s '\n''\t' >>message.txt
	exit 0;# exit successfully
else <./temp.txt htmlq article | htmlq -r div.column.full -t | tr -s '\n''\t' | sed '1{/^[[:space:]]*$/d}; ${/^[[:space:]]*$/d}; s/^[[:space:]]*//; s/[[:space:]]*$//' >>message.txt;
fi

# prepeare for print out links
<./temp.txt htmlq article | htmlq div.column.full >temp2.txt

# add new line for prettify
sed -i -e '$a\' message.txt

# append links at the end of message
paste <(htmlq -t a <./temp2.txt) <(htmlq -a href a <./temp2.txt) >>message.txt

# add new line for prettify
sed -i -e '$a\' message.txt

echo -e "------\n童軍總會官網公告連結: https://www.scout.org.tw/news_detail/${latest}\n(本訊息擷自中華民國童軍總會官網 ，並由「8 乎你知——童軍總會官網公告非官方推播」Line 官方帳號提供)" >>message.txt
