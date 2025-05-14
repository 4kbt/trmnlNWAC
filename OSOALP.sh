#!/bin/bash

# Define paths
RAW_TXT="/home/charlie/trmnlNWAC/osoalp_telemetry.txt"
HTML_OUT="/home/charlie/trmnlNWAC/osoalp_display.html"

# URL for raw telemetry text file (NWAC product text feed)
TXT_URL="https://data.nwac.us/nws/OSOALP"

# Fetch the raw telemetry text
curl -s "$TXT_URL" -o "$RAW_TXT"
if [ $? -ne 0 ] || [ ! -s "$RAW_TXT" ]; then
    echo "Failed to download telemetry text file." >&2
    exit 1
fi

sed -i 1,9d $RAW_TXT

# Wrap it in HTML for TRMNL display
cat <<EOF > "$HTML_OUT"
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
    body {
      background-color: white;
      color: black;
      font-family: monospace;
      font-size: 12px;
      padding: 10px;
    }
    pre {
      white-space: pre-wrap;
      word-wrap: break-word;
    }
  </style>
</head>
<body>
<pre>
$(cat "$RAW_TXT")
</pre>
</body>
</html>
EOF


git stage "$HTML_OUT"


