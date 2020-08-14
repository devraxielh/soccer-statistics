from flask import render_template


def forgotpassword():
    return render_template('auth/forgotpassword.html')
