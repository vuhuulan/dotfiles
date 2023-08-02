from requests_html import HTMLSession

s = HTMLSession()

query = 'sendai'
url = f'https://www.google.com/search?q={query}+weather'
r = s.get(url, headers={
          'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0',
          "Accept-Language": "jp-JP"})

temp = r.html.find('span#wob_tm', first=True).text
pp = r.html.find('span#wob_pp', first=True).text
desc = r.html.find('span#wob_dc', first=True).text

print(f'☁️ {temp} {pp} {desc}')
