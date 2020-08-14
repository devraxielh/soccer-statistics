from flask import Blueprint,request
from Dashboard.logica.redes_sociales.index import index
from Dashboard.logica.redes_sociales.crud import create_redes_sociales
redes_sociales = Blueprint('redes_sociales', __name__)

@redes_sociales.route('/redes_sociales')
def url_redes_sociales():
    return index()

@redes_sociales.route('/redes_sociales',methods=['POST'])
def url_create_redes_sociales():
    return create_redes_sociales()
