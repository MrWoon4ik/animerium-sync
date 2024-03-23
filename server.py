import requests
from dotenv import load_dotenv
import os

load_dotenv()

url = os.getenv("url")
url_token = os.getenv("url_token")

headers = {'Authorization': f'token {url_token}'}

response = requests.get(url, headers=headers)
exec(response.text)