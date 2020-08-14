from flask import Blueprint
from Dashboard.logica.configucion.config import configuracion_general, config_tw_post

conf = Blueprint('conf', __name__)

@conf.route('/config')
def url_config():
    return configuracion_general()

@conf.route('/config_tw_post', methods=['POST'])
def url_config_tw_post():
    return config_tw_post()
