import csv
import os
import random

import requests
from fastapi import FastAPI
from fastapi.responses import FileResponse
import pandas as pd

from config import API_CONFIG_ETSY_KEY

app = FastAPI(title="etsy api")


@app.get("/")
async def endpoint():
    return "This is the endpoint for app dev 1"


@app.get("/etsy/get_item/{query}", tags=["etsy"])
async def etsy(query):
    taxonomy_paths = []
    titles = []
    tags = []

    r = requests.get(f'https://openapi.etsy.com/v2/listings/active?keywords="{query}"&api_key={API_CONFIG_ETSY_KEY}')

    if r.status_code == 200:
        results = r.json()
        if 'results' in results:
            for result in results['results']:
                if 'taxonomy_path' in result:
                    for taxonomy_path in result['taxonomy_path']:
                        taxonomy_paths.append(taxonomy_path)

                if 'tags' in result:
                    for tag in result['tags']:
                        tags.append(tag)

                if 'title' in result:
                    titles.append(result['title'])

            return {
                'our_suggestion': random.choice(taxonomy_paths),
                'category': set(taxonomy_paths),
                'tags': set(tags),
                'title': titles,
            }


@app.get("/etsy/liked_item/{age_group}/{occasion}/{item_liked}", tags=["etsy"])
def etsy_item_liked(age_group, occasion, item_liked):
    fields = [age_group.lower(), occasion.lower(), item_liked.lower()]
    with open('favourite.csv', 'a', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(fields)
    return "records updated"


@app.get("/download_fav", tags=["favourite"])
async def download_fav():
    if os.path.exists('favourite.csv'):
        return FileResponse('favourite.csv')
    else:
        return 'file not found'


@app.get("/get_fav/{age_group}/{occasion}", tags=["favourite"])
async def get_fav(age_group: str, occasion: str):
    fav_item = []
    age_group = age_group.lower()
    occasion = occasion.lower()

    if os.path.exists('favourite.csv'):
        df = pd.read_csv('favourite.csv')
        for index in df.index:
            if df['age_group'][index] == age_group:
                if df['occasion'][index] == occasion:
                    fav_item.append(df['item'][index])
        try:
            choice = random.choice(fav_item)
        except IndexError:
            choice = fav_item

        return {
            "our_suggestion": choice,
            "all_items": fav_item
        }
    else:
        return 'file not found'

