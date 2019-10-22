from flask import Blueprint
from flask import render_template

app = Blueprint('application', __name__,
    template_folder='templates')


@app.route("/")
def home():
    return render_template("index.html")