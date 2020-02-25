FROM python:3.7.3-stretch

WORKDIR /var/www

COPY ./requirements.txt ./requirements.txt
COPY ./app.ini ./app.ini
COPY ./run.py ./run.py

RUN pip install -r requirements.txt

CMD ["uwsgi", "app.ini"]
