from flask import Blueprint,request
from Dashboard.logica.cuentas.index import index
from Dashboard.logica.cuentas.crud import create_cuenta
cuentas = Blueprint('cuentas', __name__)

@cuentas.route('/cuentas')
def url_cuentas():
    return index()

@cuentas.route('/cuentas',methods=['POST'])
def url_create_cuenta():
    return create_cuenta()
