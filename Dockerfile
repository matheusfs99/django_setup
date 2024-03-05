FROM python:3.11-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /djangosetup

COPY requirements.txt /djangosetup/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /djangosetup/

RUN python manage.py migrate

EXPOSE 8000