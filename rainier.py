from bs4 import BeautifulSoup
import urllib3


forecast_site = "https://a.atmos.washington.edu/data/rainier_report.html"

http = urllib3.PoolManager()

page = http.request('GET',forecast_site)

soup = BeautifulSoup(page.data)

#preamble = "<html>"
#footer = "</html>"
#forecast_date = soup.find_all("div", {"class" : "forecast-info"})
#synopsis = soup.find_all("div", {"class" : "synopsis"})
#print(preamble +str(forecast_date[0])+str(synopsis[0])+ footer)
print(soup)

