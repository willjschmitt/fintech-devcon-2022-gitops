from flask import Flask, jsonify


app = Flask(__name__)


@app.route('/')
def index():
    """Returns a simple hello world message."""
    return jsonify({'message': 'Hello, world.'})


app.run()
