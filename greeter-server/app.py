from flask import Flask, jsonify, request


app = Flask(__name__)


@app.route('/', methods = ['POST'])
def index():
    """Returns a simple hello world message, greeting the requested greetee."""
    greetee = request.json['greetee']
    return jsonify({'message': f'Hello, {greetee}.'})


app.run()
