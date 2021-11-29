import os
import requests
from bs4 import BeautifulSoup

headers = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.58 Safari/537.36"
}
r = requests.get("https://code.visualstudio.com/updates/", headers=headers)
soup = BeautifulSoup(r.text, "lxml")

for link in soup.find_all("a"):
    if "tarball" in link.get_text():
        os.system(f"wget -O vscode \"{link.get('href')}\"")
        break

os.system(
    '''
    tar --extract --overwrite --file=vscode
    rm vscode
    cd VS*/
    sudo cp -r ./* /usr/share/VSCode/
    cd ..
    rm -rf VS*/
    '''
)

