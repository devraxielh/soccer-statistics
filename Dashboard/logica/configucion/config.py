from flask import render_template, redirect, url_for, request, flash, session

from Dashboard.conexion import getConnection


def configuracion_general():
    if not session:
        return redirect(url_for('auth.url_login'))

    try:
        bd, connection = getConnection()
        sql = "SELECT * FROM conf"
        bd.execute(sql)
        config = bd.fetchone()
    except Exception as e:
        print(e)

    return render_template('configuracion/config.html', config=config)


def config_tw_post():
    if not session:
        return redirect(url_for('auth.url_login'))

    apikey = request.form.get('apikey')
    apisecretkey = request.form.get('apisecretkey')
    Cantidad_data_tw = request.form.get('Cantidad_data_tw')

    bd, connection = getConnection()

    try:
        sql = "UPDATE conf SET API_key_tw = %s, API_secret_key_tw = %s, Cantidad_data_tw = %s WHERE id = 1"
        bd.execute(sql, (apikey, apisecretkey, Cantidad_data_tw))
        connection.commit()
        flash(['1', 'Datos Actualizados'])
    except Exception as e:
        flash(['0', e])

    return redirect(url_for('conf.url_config'))
