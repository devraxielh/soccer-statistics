from flask import redirect, url_for, session


def logout():
    if 'loggedin' in session:
        session.clear()
    return redirect(url_for('auth.url_login'))
