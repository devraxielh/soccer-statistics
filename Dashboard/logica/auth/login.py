import crypt

from flask import render_template, redirect, url_for, request, flash, session

from Dashboard.conexion import getConnection


def login():
    if 'loggedin' in session:
        return redirect(url_for('app.home'))
    return render_template('auth/login.html')


def login_post():
    email = request.form.get('email')
    password = crypt.crypt(request.form.get('password'), 'SALT_KEY')

    try:
        bd, connection = getConnection()
        sql = "SELECT id,correo FROM users_sis WHERE correo = %s and password = %s"
        bd.execute(sql, (email, password))
        account = bd.fetchone()
        bd.close()
    except Exception as e:
        flash(['Error...'+str(e)+'', 'bg-warning'])

    if account:
        session['loggedin'] = True
        session['id'] = account['id']
        session['username'] = account['correo']
        return redirect(url_for('app.url_home'))

    flash(['Datos incorrectos...', 'bg-danger'])
    return redirect(url_for('auth.url_login'))
