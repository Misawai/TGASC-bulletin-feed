#!/usr/bin/env bash
# main.sh
# Fetch bulletin of TGASC.

set -e

latest=$(<./latest)

echo ${latest}

curl -s https://www.scout.org.tw/news_detail/${latest} >temp.txt

<./temp.txt htmlq -t h1 | tr -d '\n''\t' >message.txt

sed -i "1a\\" message.txt

<./temp.txt htmlq article | htmlq -r div.column.full -t | tr -d '\n''\t' >>message.txt

cat ./message.txt
