from flask import render_template, redirect, url_for, session,request,flash
from Dashboard.conexion import getConnection

def create_redes_sociales():
    if not session:
        return redirect(url_for('auth.url_login'))

    red_social = request.form.get('red_social')

    bd, connection = getConnection()

    try:
        sql = "INSERT INTO redes_sociales VALUES (NULL,%s,NULL,NULL)"
        bd.execute(sql, (red_social))
        connection.commit()
        bd.close()
        flash(['Red Social Guardada...', 'bg-success'])
    except Exception as e:
        flash(['Error...' + str(e) + '', 'bg-warning'])

    return redirect(url_for('redes_sociales.url_redes_sociales'))