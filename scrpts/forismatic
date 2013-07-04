#!/bin/sh

WORDS=`wget -qO - http://api.forismatic.com/api/1.0/ --post-data="method=getQuote&format=text&lang=ru"`
echo $WORDS | fold -sw 160
