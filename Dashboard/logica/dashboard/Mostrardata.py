from flask import json,redirect,url_for,session,flash,request
from Dashboard.conexion import getConnection

def MostrarAnalisisTwitter_Polaridad():
    screen_name = request.form.get('cuenta')
    if not session:
        return redirect(url_for('auth.url_login'))

    try:
        bd, connection = getConnection()
        sql = "SELECT classification,count(*) as c,tp.total FROM data_twitter_detalle as d1,data_twitter as d2,(SELECT count(*) as total FROM data_twitter_detalle as d1,data_twitter as d2 where d1.usuario=d2.id AND screen_name='"+screen_name+"') as tp where d1.usuario=d2.id AND screen_name='"+screen_name+"' GROUP by classification,tp.total"
        bd.execute(sql)
        detalle=bd.fetchall()
    except Exception as e:
        detalle = str(e)

    return json.dumps(detalle)

def MostrarAnalisisTwitter_Visitas():
    screen_name = request.form.get('cuenta')
    if not session:
        return redirect(url_for('auth.url_login'))

    try:
        bd, connection = getConnection()
        sql = "SELECT place FROM data_twitter_detalle as d1,data_twitter as d2 where d1.usuario=d2.id AND screen_name=%s and place<>'' group by place"
        bd.execute(sql,screen_name)
        places=bd.fetchall()
        print(places)
    except Exception as e:
        places = str(e)

    return json.dumps(places)


