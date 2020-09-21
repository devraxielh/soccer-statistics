FROM python:3.7.4-alpine
WORKDIR /project
ADD . /project


RUN  python -m venv venv
CMD  ["source venv/bin/activate"]

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["export FLASK_APP=Dashboard", "export FLASK_ENV=production", "flask run"]