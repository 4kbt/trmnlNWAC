#!/bin/bash

cd /home/charlie/trmnlNWAC/

FN=nwac_weather_forecast.html

python3 forecast.py > $FN
git stage $FN

timestamp(){ 
   date +"%d.%m.%Y um %H:%M" 
}
git commit -am "Auto Server Commit $(timestamp)"

git push --repo https://4kbt:`cat trmnlNWACToken.txt`@github.com/4kbt/trmnlNWAC.git
