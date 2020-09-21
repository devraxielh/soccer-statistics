import tweepy
from flask import json
from textblob import TextBlob,Blobber
from textblob.sentiments import NaiveBayesAnalyzer
tb = Blobber(analyzer=NaiveBayesAnalyzer())
from Dashboard.conexion import getConnection
from googletrans import Translator
import pprint
import re
import numpy as np
from matplotlib.backends.backend_agg import FigureCanvasAgg
from matplotlib.figure import Figure
import matplotlib.pyplot as plt
import pandas as pd
from flask import send_file

consumer_key = "F70Tuo2dL0e08mgLU7QTSP9R9"
consumer_secret = "I8jKWmBnq2qOlGVnRKintRztIL79q53YDmMUZV5phWpKW9SnBP"
access_key = "92553187-VF6nsdE1SLFglseQ2DMUBoGIb6ZxQ5FrdgmbM2ioD"
access_secret = "izY6ndERijvjOnHLz3e7TIjbAGJj2qlGj5aTf6ZSpoCuW"

def get_correlation(screen_name):
    """
    TODO: Add correct data to this
    """
    df = pd.DataFrame({'a': np.random.randint(0, 50, 1000)})
    df['b'] = df['a'] + np.random.normal(0, 10, 1000) # positively correlated with 'a'
    df['c'] = 100 - df['a'] + np.random.normal(0, 5, 1000) # negatively correlated with 'a'
    df['d'] = np.random.randint(0, 50, 1000) # not correlated with 'a'

    plt.matshow(df.corr())
    plt.xticks(range(len(df.columns)), df.columns)
    plt.yticks(range(len(df.columns)), df.columns)
    plt.colorbar()
    fig, ax = plt.subplots()
    draw(ax)
    return fig_response(fig)

def get_correlation(screen_name):
    fig, ax = plt.subplots()
    draw(ax)
    return fig_response(fig)

def fig_response(fig):
    """Turn a matplotlib Figure into Flask response"""
    img_bytes = BytesIO()
    fig.savefig(img_bytes)
    img_bytes.seek(0)
    return send_file(img_bytes, mimetype='image/png')


def filter_text(texto="", emoji_pattern="", traductor={}):
    ret_val = emoji_pattern.sub(r'', texto)
    ret_val = re.sub(r'\w+:\/{2}[\d\w-]+(\.[\d\w-]+)*(?:(?:\/[^\s/]*))*', '', ret_val)

    if ( len(ret_val.strip()) == 0 or ret_val is None):  
        return ""
    
    ret_val = traductor.translate(ret_val, src="es", dest='en').text
    return ret_val


def get_all_tweets(screen_name, limit_number):
    traductor = Translator()
    limit_number = int(limit_number) # 3240
    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_key, access_secret)
    api = tweepy.API(auth)
    alltweets = []
    new_tweets = api.user_timeline(screen_name=screen_name,count=1)
    alltweets.extend(new_tweets)
    
    # Si no hay tweets en la cuenta, no hacer nada
    if not new_tweets:
        diccionario = {'estados': '202', 'msg':"Terminado"}
        return json.dumps(diccionario)

    oldest = alltweets[-1].id - 1

    emoji_pattern = re.compile("["
                                   u"\U0001F600-\U0001F64F"  # emoticons
                                   u"\U0001F300-\U0001F5FF"  # symbols & pictographs
                                   u"\U0001F680-\U0001F6FF"  # transport & map symbols
                                   u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
                                   u"\U00002500-\U00002BEF"  # chinese char
                                   u"\U00002702-\U000027B0"
                                   u"\U00002702-\U000027B0"
                                   u"\U000024C2-\U0001F251"
                                   u"\U0001f926-\U0001f937"
                                   u"\U00010000-\U0010ffff"
                                   u"\u2640-\u2642"
                                   u"\u2600-\u2B55"
                                   u"\u200d"
                                   u"\u23cf"
                                   u"\u23e9"
                                   u"\u231a"
                                   u"\ufe0f"  # dingbats
                                   u"\u3030"
                                   "]+", flags=re.UNICODE)

    bd, connection = getConnection()
    while len(new_tweets) > 0 and len(alltweets) <= limit_number:

        texto = filter_text(new_tweets[0]._json['text'], emoji_pattern, traductor)
        descripcion = filter_text(new_tweets[0]._json['user']['description'], emoji_pattern, traductor)

        sql = "SELECT * FROM data_twitter WHERE id=%s"
        bd.execute(sql, (new_tweets[0]._json['user']['id_str']))
        data = bd.fetchone()

        if data:
            sql = "UPDATE data_twitter SET screen_name=%s,name=%s,location=%s,description=%s WHERE id=%s"
            bd.execute(sql, (new_tweets[0]._json['user']['screen_name'], new_tweets[0]._json['user']['name'],
                             new_tweets[0]._json['user']['location'], descripcion,
                             new_tweets[0]._json['user']['id_str']))
        else:
            sql = "INSERT INTO data_twitter VALUES (%s, %s, %s, %s, %s)"
            bd.execute(sql, (new_tweets[0]._json['user']['id_str'], new_tweets[0]._json['user']['screen_name'],
                             new_tweets[0]._json['user']['name'], new_tweets[0]._json['user']['location'],
                             descripcion))

        connection.commit()

        sql = "SELECT * FROM data_twitter_detalle WHERE id=%s"
        bd.execute(sql, (new_tweets[0]._json['id_str']))
        twit = bd.fetchone()

        if twit:
            sql = "UPDATE data_twitter_detalle SET text=%s WHERE id=%s"
            bd.execute(sql, (texto, new_tweets[0]._json['id_str']))
        else:
            sql = "INSERT INTO data_twitter_detalle VALUES (%s, %s, %s, %s, %s, %s,NULL,NULL,NULL,NULL,NULL,NULL)"
            if (new_tweets[0]._json['place']):
                bd.execute(sql, (new_tweets[0]._json['id_str'], 
                                new_tweets[0]._json['user']['id_str'], 
                                texto,
                                new_tweets[0]._json['created_at'], 
                                new_tweets[0]._json['place']['place_type'], 
                                new_tweets[0]._json['place']['name']))
            else:
                bd.execute(sql, (new_tweets[0]._json['id_str'], new_tweets[0]._json['user']['id_str'], texto, new_tweets[0]._json['created_at'], "", ""))

        connection.commit()
        new_tweets = api.user_timeline(screen_name=screen_name, count=1, max_id=oldest)
        alltweets.extend(new_tweets)
        oldest = alltweets[-1].id - 1


    print(str(len(alltweets)-1) + " tweets descargados hasta el momento")
    
    # Extracción de menciones

    search_query = f'@{screen_name}'
    retweet_filter='-filter:retweets'

    mentions = api.search(q=search_query+retweet_filter, count=limit_number)

    polarity_list = []
    numbers_list = []
    number = 1

    for tweet in alltweets:
        try:
            text = filter_text(tweet._json['text'], emoji_pattern, traductor)
            analysis = TextBlob(text)
            analysis2 = tb(text)
            # https://textblob.readthedocs.io/en/dev/quickstart.html#sentiment-analysis
            sentiment = analysis.sentiment   
            polarity = sentiment.polarity
            subjectivity = sentiment.subjectivity
            polarity_list.append(polarity)
            numbers_list.append(number)
            number = number + 1
            sql = "SELECT * FROM data_twitter_detalle WHERE id=%s"
            bd.execute(sql, (tweet._json['id_str']))
            test = bd.fetchone()
            if test:
                sql = "UPDATE data_twitter_detalle SET polarity=%s,subjectivity=%s ,classification=%s ,p_pos=%s ,p_neg=%s WHERE id = %s"
                bd.execute(sql, (polarity, subjectivity, analysis2.sentiment.classification,analysis2.sentiment.p_pos,analysis2.sentiment.p_neg, tweet.id))     
            else:
                sql = "INSERT INTO data_twitter_detalle VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                if (tweet._json['place']):
                    bd.execute(sql, (tweet._json['id_str'],
                                tweet._json['user']['id_str'],
                                text,
                                tweet._json['created_at'],
                                tweet._json['place']['place_type'],
                                tweet._json['place']['name'],
                                polarity,
                                subjectivity,
                                analysis2.sentiment.classification,
                                analysis2.sentiment.p_pos,
                                analysis2.sentiment.p_neg,
                                ""
                                ))
                else:
                    bd.execute(sql, (tweet._json['id_str'],
                                tweet._json['user']['id_str'],
                                text,
                                tweet._json['created_at'],
                                "",
                                "",
                                polarity,
                                subjectivity,
                                analysis2.sentiment.classification,
                                analysis2.sentiment.p_pos,
                                analysis2.sentiment.p_neg,
                                ""
                                ))
            connection.commit()
        except tweepy.TweepError as e:
            print(e.reason)
        except StopIteration:
            break



    #TODO: REFACTOR THIS
    
    for tweet in mentions:
        try:
            text = filter_text(tweet._json['text'], emoji_pattern, traductor)
            analysis = TextBlob(text)
            analysis2 = tb(text)
            # https://textblob.readthedocs.io/en/dev/quickstart.html#sentiment-analysis
            sentiment = analysis.sentiment   
            polarity = sentiment.polarity
            subjectivity = sentiment.subjectivity
            polarity_list.append(polarity)
            numbers_list.append(number)
            number = number + 1
            sql = "SELECT * FROM data_twitter_detalle WHERE id=%s"
            bd.execute(sql, (tweet._json['id_str']))
            test = bd.fetchone()
            if test:
                sql = "UPDATE data_twitter_detalle SET polarity=%s,subjectivity=%s ,classification=%s ,p_pos=%s ,p_neg=%s, is_mentioned=%s WHERE id = %s"
                bd.execute(sql, (polarity, subjectivity, analysis2.sentiment.classification,analysis2.sentiment.p_pos,analysis2.sentiment.p_neg, screen_name, tweet.id))     
            else:
                sql = "INSERT INTO data_twitter_detalle VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s, %s)"
                if (tweet._json['place']):
                    bd.execute(sql, (tweet._json['id_str'],
                                tweet._json['user']['id_str'],
                                text,
                                tweet._json['created_at'],
                                tweet._json['place']['place_type'],
                                tweet._json['place']['name'],
                                polarity,
                                subjectivity,
                                analysis2.sentiment.classification,
                                analysis2.sentiment.p_pos,
                                analysis2.sentiment.p_neg,
                                screen_name
                                ))
                else:
                    bd.execute(sql, (tweet._json['id_str'],
                                tweet._json['user']['id_str'],
                                text,
                                tweet._json['created_at'],
                                "",
                                "",
                                polarity,
                                subjectivity,
                                analysis2.sentiment.classification,
                                analysis2.sentiment.p_pos,
                                analysis2.sentiment.p_neg,
                                screen_name))
            connection.commit()
        except tweepy.TweepError as e:
            print(e.reason)
        except StopIteration:
            break




    diccionario = {'estados': '202', 'msg':"Terminado"}
    return json.dumps(diccionario)

