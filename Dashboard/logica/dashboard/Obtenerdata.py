import tweepy
from flask import json
from textblob import TextBlob,Blobber
from textblob.sentiments import NaiveBayesAnalyzer
tb = Blobber(analyzer=NaiveBayesAnalyzer())
from Dashboard.conexion import getConnection
import re
consumer_key = "F70Tuo2dL0e08mgLU7QTSP9R9"
consumer_secret = "I8jKWmBnq2qOlGVnRKintRztIL79q53YDmMUZV5phWpKW9SnBP"
access_key = "92553187-VF6nsdE1SLFglseQ2DMUBoGIb6ZxQ5FrdgmbM2ioD"
access_secret = "izY6ndERijvjOnHLz3e7TIjbAGJj2qlGj5aTf6ZSpoCuW"

def get_all_tweets(screen_name, limit_number):
    limit_number = int(limit_number) # 3240
    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_key, access_secret)
    api = tweepy.API(auth)
    alltweets = []
    new_tweets = api.user_timeline(screen_name=screen_name,count=1)
    alltweets.extend(new_tweets)
    oldest = alltweets[-1].id - 1

    while len(new_tweets) > 0 and len(alltweets) <= limit_number:
        new_tweets = api.user_timeline(screen_name=screen_name, count=1, max_id=oldest)
        bd, connection = getConnection()
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

        texto = emoji_pattern.sub(r'', new_tweets[0]._json['text'])
        texto = re.sub(r'\w+:\/{2}[\d\w-]+(\.[\d\w-]+)*(?:(?:\/[^\s/]*))*', '', texto)

        sql = "SELECT * FROM data_twitter WHERE id=%s"
        bd.execute(sql, (new_tweets[0]._json['user']['id_str']))
        data = bd.fetchone()

        if data:
            sql = "UPDATE data_twitter SET screen_name=%s,name=%s,location=%s,description=%s WHERE id = %s"
            bd.execute(sql, (new_tweets[0]._json['user']['screen_name'], new_tweets[0]._json['user']['name'],
                             new_tweets[0]._json['user']['location'], new_tweets[0]._json['user']['description'],
                             new_tweets[0]._json['user']['id_str']))
        else:
            sql = "INSERT INTO data_twitter VALUES (%s, %s, %s, %s, %s)"
            bd.execute(sql, (new_tweets[0]._json['user']['id_str'], new_tweets[0]._json['user']['screen_name'],
                             new_tweets[0]._json['user']['name'], new_tweets[0]._json['user']['location'],
                             new_tweets[0]._json['user']['description']))

        connection.commit()

        sql = "SELECT * FROM data_twitter_detalle WHERE id=%s"
        bd.execute(sql, (new_tweets[0]._json['id_str']))
        twit = bd.fetchone()

        if twit:
            sql = "UPDATE data_twitter_detalle SET text=%s WHERE id = %s"
            bd.execute(sql, (texto, new_tweets[0]._json['id_str']))
        else:
            sql = "INSERT INTO data_twitter_detalle VALUES (%s, %s, %s, %s, %s,NULL,NULL,NULL,NULL,NULL)"
            if (new_tweets[0]._json['place']):
                bd.execute(sql, (new_tweets[0]._json['id_str'], new_tweets[0]._json['user']['id_str'], texto,
                                 new_tweets[0]._json['place']['place_type'], new_tweets[0]._json['place']['name']))
            else:
                bd.execute(sql, (new_tweets[0]._json['id_str'], new_tweets[0]._json['user']['id_str'], texto, "", ""))

        connection.commit()
        alltweets.extend(new_tweets)
        oldest = alltweets[-1].id - 1

        #print(str(len(alltweets)-1) + " tweets descargados hasta el momento")

        polarity_list = []
        numbers_list = []
        number = 1

        for tweet in alltweets:
            try:
                #print(tweet.id)
                analysis = TextBlob(tweet.text)
                analysis2 = tb(tweet.text)
                # https://textblob.readthedocs.io/en/dev/quickstart.html#sentiment-analysis
                analysis = analysis.sentiment
                polarity = analysis.polarity
                polarity_list.append(polarity)
                numbers_list.append(number)
                number = number + 1
                sql = "UPDATE data_twitter_detalle SET polarity=%s,sentiment=%s ,classification=%s ,p_pos=%s ,p_neg=%s WHERE id = %s"
                bd.execute(sql, (analysis.polarity,analysis.subjectivity,analysis2.sentiment.classification,analysis2.sentiment.p_pos,analysis2.sentiment.p_neg,tweet.id))
                connection.commit()
            except tweepy.TweepError as e:
                print(e.reason)
            except StopIteration:
                break

    diccionario = {'estados': '202', 'msg':"Terminado"}
    return json.dumps(diccionario)