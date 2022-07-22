# app-dev-1: Gift suggestions
The app is made using Flutter. Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications. The backend of the app is made using FastAPI, which is a Web framework for developing RESTful APIs in Python. This API is deployed on Heroku and It can be found at: https://app-dev-1.herokuapp.com/docs.

The API contains an endpoint to get suggestions from Etsy API. This API returns tags, categories, and titles of items returned by Etsy API. A random item is shown as the primary suggestion for the query. Etsy, Inc. is an American e-commerce company focused on handmade or vintage items and craft supplies. These items fall under a wide range of categories, including jewelry, bags, clothing, home décor and furniture, toys, art, as well as craft supplies, and tools.

Another endpoint of FastAPI is to save good suggestions from Etsy API on an excel sheet uploaded on DropBox. The Excel sheet has three columns: age group, occasion, and item. There are 1439 suggestions stored in the Excel sheet which is a collection of suggested items on Etsy and scraped data from the website https://www.gifts.com/. This scrapping is done using Scrapy. Scrapy is a free and open-source web-crawling framework written in Python. Originally designed for web scraping, it can also be used to extract data using APIs or as a general-purpose web crawler. This excel sheet can be downloaded from the FastAPI itself.

Another endpoint available on FastAPI is to retrieve data from this excel sheet. This is the only endpoint available directly through the flutter app. It takes gender and occasion as input.
When the user first opens the app, the user has to select the recipient’s gender, followed by the occasion of gifting. An appropriate gift option is displayed on the excel sheet.

# Screenshots
<p align = "center">
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture1.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture2.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture3.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture4.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture5.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture6.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture7.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture8.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture9.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture10.png" width="400" />
  <img src="https://github.com/Maanaav/app-dev-1/blob/main/fastapi/screenshots/Picture11.png" width="400" />
</p>
