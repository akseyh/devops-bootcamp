FROM python:3.6

COPY requirements.txt requirements.txt

# COPY ile requirements.txt'yi kopyaladığım için burada kullanabilirim.
RUN pip install -r requirements.txt

COPY main.py main.py

# python ile alakalı komutlar
CMD gunicorn -b 0.0.0.0:8000 main:api