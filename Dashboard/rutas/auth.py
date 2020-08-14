from flask import Blueprint

from Dashboard.logica.auth.forgotpassword import forgotpassword
from Dashboard.logica.auth.login import login, login_post
from Dashboard.logica.auth.logout import logout
from Dashboard.logica.auth.profile import profile, profile_post
from Dashboard.logica.auth.signup import signup, signup_post

auth = Blueprint('auth', __name__)

@auth.route('/signup')
def url_signup():
    return signup()

@auth.route('/signup', methods=['POST'])
def url_signup_post():
    return signup_post()

@auth.route('/login')
def url_login():
    return login()

@auth.route('/login', methods=['POST'])
def url_login_post():
    return login_post()

@auth.route('/logout', methods=['GET', 'POST'])
def url_logout():
    return logout()

@auth.route('/forgotpassword')
def url_forgotpassword():
    return forgotpassword()

@auth.route('/profile')
def url_profile():
    return profile()

@auth.route('/profile_post', methods=['POST'])
def url_profile_post():
    return profile_post()









