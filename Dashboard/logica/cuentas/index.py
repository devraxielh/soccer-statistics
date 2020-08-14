from flask import render_template, redirect, url_for, session,request,flash
from Dashboard.conexion import getConnection

def index():
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
        sql = "SELECT * FROM redes_sociales"
        bd.execute(sql)
        redes=bd.fetchall()
    except Exception as e:
        redes = ""
        flash(['Error...'+str(e)+'', 'bg-warning'])

    return render_template('cuentas/inicio.html',cuentas=cuentas,redes=redes)