from flask import render_template, redirect, url_for, session,request,flash
from Dashboard.conexion import getConnection

def create_cuenta():
    if not session:
        return redirect(url_for('auth.url_login'))

    cuenta = request.form.get('cuenta')
    red_social = request.form.get('red_social')

    bd, connection = getConnection()

    try:
        sql = "INSERT INTO cuentas VALUES (NULL,%s,%s,NULL,NULL)"
        bd.execute(sql, (cuenta,red_social))
        connection.commit()
        bd.close()
        flash(['Cuenta Guardada...', 'bg-success'])
    except Exception as e:
        flash(['Error...' + str(e) + '', 'bg-warning'])

    return redirect(url_for('cuentas.url_cuentas'))