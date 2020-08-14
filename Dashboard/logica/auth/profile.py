import crypt
from flask import render_template, redirect, url_for, session, flash, request
from Dashboard.conexion import getConnection

def profile():
    if not session:
        return redirect(url_for('auth.url_login'))

    try:
        bd, connection = getConnection()
        sql = "SELECT * FROM users_sis where id=%s"
        bd.execute(sql, (session['id']))
        profile = bd.fetchone()
        bd.close()
    except Exception as e:
        flash(['Error...'+str(e)+'', 'bg-warning'])

    return render_template('auth/profile.html', profile=profile)


def profile_post():
    if not session:
        return redirect(url_for('auth.url_login'))

    name = request.form.get('name')

    bd, connection = getConnection()

    if (request.form.get('password')):
        password = crypt.crypt(request.form.get('password'), 'SALT_KEY')
        sql = "UPDATE users_sis SET nombre = %s, password = %s WHERE id = %s"
        bd.execute(sql, (name, password, session['id']))
    else:
        sql = "UPDATE users_sis SET nombre = %s WHERE id = %s"
        bd.execute(sql, (name, session['id']))

    try:
        connection.commit()
        flash(['Datos Actualizados...', 'bg-success'])
    except Exception as e:
        flash(['Error...'+str(e)+'', 'bg-warning'])

    bd.close()

    return redirect(url_for('auth.url_profile'))
