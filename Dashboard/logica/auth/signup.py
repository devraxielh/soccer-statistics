import crypt

from flask import render_template, redirect, url_for, request, flash

from Dashboard.conexion import getConnection


def signup():
    return render_template('auth/register.html')


def signup_post():
    email = request.form.get('email')
    bd, connection = getConnection()
    sql = "SELECT id,correo FROM users_sis WHERE correo =%s"
    bd.execute(sql, (email))
    account = bd.fetchone()

    if account:
        flash(['Correo en uso...', 'bg-danger'])
        return redirect(url_for('auth.url_signup'))

    name = request.form.get('name')
    password = crypt.crypt(request.form.get('password'), 'SALT_KEY')

    try:
        sql = "INSERT INTO users_sis VALUES (NULL, %s, %s, %s)"
        bd.execute(sql, (name, email, password))
        connection.commit()
        bd.close()
        flash(['Digita tus datos para entrar...', 'bg-success'])
    except Exception as e:
        flash(['Error...' + str(e) + '', 'bg-warning'])

    return redirect(url_for('auth.url_login'))