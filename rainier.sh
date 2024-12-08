#!/bin/bash

FN="rainier.html"

python3 rainier.py  | sed -n '/&amp;&amp;/q;p'| sed 's/<pre>/<font face="Arial" size="5">/' |sed 's/.SYNOPSIS...//' > $FN
echo "</html>" >> $FN


git stage $FN

