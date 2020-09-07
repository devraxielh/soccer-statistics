from flask import Flask

def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'secret-key-goes-here'
    app.config['TEMPLATES_AUTO_RELOAD'] = True

    from Dashboard.rutas.auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint)

    from Dashboard.rutas.app import app as main_blueprint
    app.register_blueprint(main_blueprint)

    from Dashboard.rutas.conf import conf as conf_blueprint
    app.register_blueprint(conf_blueprint)

    from Dashboard.rutas.cuentas import cuentas as cuentas_blueprint
    app.register_blueprint(cuentas_blueprint)

    from Dashboard.rutas.redes_sociales import redes_sociales as redes_sociales_blueprint
    app.register_blueprint(redes_sociales_blueprint)

    return app

