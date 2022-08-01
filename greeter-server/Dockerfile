# We use a specific digest for a released verison of 3.9-slim-buster, so that
# the docker build can be more reproducible.
# FROM python:3.9-slim-buster
FROM python@sha256:79731e75e4acf62aac253411fd011fcc42fe85f266afe473eec4a1fc7e82e399

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
