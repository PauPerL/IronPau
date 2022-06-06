#!/usr/bin/env python
# coding: utf-8

# In[ ]:


#function that does all the scraping and saves it

def scrape_billboard_100():
    #get the tools - import libs
    import pandas as pd
    import requests
    from bs4 import BeautifulSoup
    from tqdm.notebook import tqdm
    
    #use the url to get the page and start scraping
    url = "https://www.billboard.com/charts/hot-100/"
    page = requests.get(url)
    soup = BeautifulSoup(page.content, 'html.parser')
    
    
    # start lists and get length of the list
    bb_position= []
    song_name= []
    artist_name= []

    len_songs=len(soup.select('h3.c-title.a-no-trucate'))
    len_songs_check=len(soup.select('span.c-label.a-no-trucate'))
    
    #loop to get all the songs with artist
    for i in tqdm(range(len_songs)):
        bb_position.append(i+1) #esto es un poco trampa porque nos estamos inventando la posicion segun hacemos el for
        song_name.append(soup.select('h3.c-title.a-no-trucate')[i].get_text(strip=True))
        artist_name.append(soup.select('span.c-label.a-no-trucate')[i].get_text(strip=True))
    
    #create the dataframe
    songs_100 = pd.DataFrame({'rank':bb_position,
                           'name':song_name,
                           'artist':artist_name})
    
    #save the dataframe
    songs_100.to_csv('songs_100.csv', index=False)
    
    return songs_100

