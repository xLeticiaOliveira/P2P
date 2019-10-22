from flask import Flask
from application.routes import app
import os

basedir = os.path.abspath(os.path.dirname(__file__))
SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or 'sqlite:///' + os.path.join(basedir, 'application/database/app.db')

appf = Flask(__name__)
appf.config['SQLALCHEMY_DATABASE_URI'] = SQLALCHEMY_DATABASE_URI
appf.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
appf.register_blueprint(app)

if __name__ == '__main__':
    appf.run(debug=True)
