from config import appf
from application.routes import app

appf.register_blueprint(app)

if __name__ == '__main__':
    appf.run(debug=True)