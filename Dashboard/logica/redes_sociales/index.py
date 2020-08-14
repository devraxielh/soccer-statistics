from flask import render_template, redirect, url_for, session,request,flash
from Dashboard.conexion import getConnection

def index():
    if not session:
        return redirect(url_for('auth.url_login'))

    try:
        bd, connection = getConnection()
        sql = "SELECT * FROM redes_sociales"
        bd.execute(sql)
        redes=bd.fetchall()
    except Exception as e:
        redes = ""
        flash(['Error...'+str(e)+'', 'bg-warning'])

    return render_template('redes_sociales/inicio.html',redes=redes)