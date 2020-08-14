from flask import render_template, redirect, url_for, session,request,flash,json
from Dashboard.conexion import getConnection
from Dashboard.logica.dashboard.Obtenerdata import get_all_tweets

def home():
    if not session:
        return redirect(url_for('auth.url_login'))

    try:
        bd, connection = getConnection()
        sql = "SELECT cuentas.id,cuentas.cuenta,redes_sociales.nombre as red FROM cuentas,redes_sociales where cuentas.red_social=redes_sociales.id"
        bd.execute(sql)
        cuentas=bd.fetchall()
    except Exception as e:
        cuentas = ""
        flash(['Error...'+str(e)+'', 'bg-warning'])

    try:
        bd, connection = getConnection()
        sql = "SELECT count(*) as c FROM cuentas"
        bd.execute(sql)
        c_cuentas=bd.fetchone()
    except Exception as e:
        c_cuentas = ""
        flash(['Error...'+str(e)+'', 'bg-warning'])

    try:
        bd, connection = getConnection()
        sql = "SELECT count(*) as c FROM cuentas where  red_social=1"
        bd.execute(sql)
        c_cuentas_t=bd.fetchone()
    except Exception as e:
        c_cuentas_t = ""
        flash(['Error...'+str(e)+'', 'bg-warning'])

    try:
        bd, connection = getConnection()
        sql = "SELECT count(*) as c FROM cuentas where  red_social=2"
        bd.execute(sql)
        c_cuentas_f=bd.fetchone()
    except Exception as e:
        c_cuentas_f = ""
        flash(['Error...'+str(e)+'', 'bg-warning'])

    try:
        bd, connection = getConnection()
        sql = "SELECT count(*) as c FROM cuentas where  red_social=3"
        bd.execute(sql)
        c_cuentas_i=bd.fetchone()
    except Exception as e:
        c_cuentas_i = ""
        flash(['Error...'+str(e)+'', 'bg-warning'])

    try:
        bd, connection = getConnection()
        sql = "SELECT count(*) as c FROM data_twitter_detalle"
        bd.execute(sql)
        c_cuentas_t_d=bd.fetchone()
    except Exception as e:
        c_cuentas_t_d= ""
        flash(['Error...'+str(e)+'', 'bg-warning'])

    return render_template('home.html',
                           cuentas=cuentas,
                           c_cuentas=c_cuentas,
                           c_cuentas_t=c_cuentas_t,
                           c_cuentas_f=c_cuentas_f,
                           c_cuentas_i=c_cuentas_i,
                           c_cuentas_i_d=0,
                           c_cuentas_f_d=0,
                           c_cuentas_t_d=c_cuentas_t_d
                           )
def obtenerdata_twitter():
    cuenta = request.form.get('cuenta')
    bd, connection = getConnection()
    sql = "SELECT Cantidad_data_tw FROM conf where id=1"
    bd.execute(sql)
    cantidad = bd.fetchone()
    return get_all_tweets(cuenta,cantidad['Cantidad_data_tw'])
