#!/usr/bin/env bash
# main.sh
# Fetch bulletin of TGASC.

set -e

latest=$(<./latest)

echo ${latest}

curl -s https://www.scout.org.tw/news_detail/${latest} >temp.txt # get the latest paragraph

<./temp.txt htmlq -t h1 | tr -d '\n''\t' >message.txt

sed -i "1a\\" message.txt # add new line after reading title.

<./temp.txt htmlq article | htmlq -r div.column.full -t | tr -d '\n''\t'

if [ -z "$(<./temp.txt htmlq article | htmlq -r div.column.full -t | tr -d '\n''\t')" ]; then \
# if after remove div.column.full still have character, consider as pure article, without any links.
	<./temp.txt htmlq article -p -t| tr -s '\n''\t' >>message.txt;
else <./temp.txt htmlq article | htmlq -r div.column.full -t | tr -d '\n''\t' >>message.txt;
fi
# <./temp.txt htmlq article | htmlq div.column.full

cat ./message.txt