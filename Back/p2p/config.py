from flask import Flask, Blueprint
from flask_sqlalchemy import SQLAlchemy
import os


basedir = os.path.abspath(os.path.dirname(__file__))
SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or 'sqlite:///' + os.path.join(basedir, 'application/database/app.db')

appf = Flask(__name__)
appf.config['SQLALCHEMY_DATABASE_URI'] = SQLALCHEMY_DATABASE_URI
appf.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

db = SQLAlchemy(appf)

