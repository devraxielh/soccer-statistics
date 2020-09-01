from flask import Blueprint,render_template,redirect,url_for,session,request,json
from Dashboard.logica.dashboard.index import home,obtenerdata_twitter
from Dashboard.logica.dashboard.Mostrardata import MostrarAnalisisTwitter_Polaridad,MostrarAnalisisTwitter_Visitas

app = Blueprint('app', __name__)

@app.route('/')
def index():
    return redirect(url_for('auth.url_login'))

@app.route('/home')
def url_home():
    return home()

@app.route('/obtenerdata/twitter', methods=['POST'])
def url_obtenerdata_twitter():
    return obtenerdata_twitter()

@app.route('/mostrardata_Polaridad/twitter', methods=['POST'])
def url_mostrardata_twitter():
    return MostrarAnalisisTwitter_Polaridad()

@app.route('/mostrardata_Subjetividad/twitter', methods=['POST'])
def url_mostrardata_twitter():
    return MostrarAnalisisTwitter_Subjetividad()

@app.route('/mostrardata_visitas/twitter', methods=['POST'])
def url_mostrar_visitas_twitter():
    return MostrarAnalisisTwitter_Visitas()
