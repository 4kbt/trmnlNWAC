#!/bin/bash

cd /home/charlie/trmnlNWAC/

FN=nwac_weather_forecast.html

python3 forecast.py | 
sed 's/<div class="forecast-info">//'|
sed 's/<div class="forecast-date">//'|
sed 's/<\/div>//' |
sed 's/<div class="forecaster">//' | 
sed 's/<div class="synopsis">//' > $FN


git stage $FN

./rainier.sh
./OSOALP.sh

timestamp(){ 
   date +"%d.%m.%Y um %H:%M" 
}
git commit -am "Auto Server Commit $(timestamp)"

git push --repo https://4kbt:`cat trmnlNWACToken.txt`@github.com/4kbt/trmnlNWAC.git
