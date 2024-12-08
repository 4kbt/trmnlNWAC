from bs4 import BeautifulSoup
import urllib3


forecast_site = "https://nwac.us/mountain-weather-forecast/"

http = urllib3.PoolManager()

page = http.request('GET',forecast_site)

soup = BeautifulSoup(page.data)

preamble = """<!DOCTYPE html>
<html>
  <head>
    <link rel=\"stylesheet\" href=\"https://usetrmnl.com/css/latest/plugins.css\">
    <link rel=\"stylesheet\" href=\"https://usetrmnl.com/js/latest/plugins.js\">
  </head>
  <div class="title_bar">
  <span class="title">NWAC Weather Synopsis</span>
</div>
"""
footer = "</html>"
forecast_date = soup.find_all("div", {"class" : "forecast-info"})
synopsis = soup.find_all("div", {"class" : "synopsis"})
print(preamble +str(forecast_date[0])+str(synopsis[0])+ footer)

