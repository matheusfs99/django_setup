FROM python:3.11-alpine

ARG requirements_file="requirements/production.txt"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements /code/requirements

WORKDIR /code

RUN pip install --upgrade pip && pip install -r $requirements_file

COPY . /code/

# Determines whether the process running is active, running and healthy.
HEALTHCHECK CMD ["curl", "--fail", "http://localhost:8000", "||", "exit 1"]

EXPOSE 80

CMD ["uwsgi", "--http=0.0.0.0:80", "--module=conf.wsgi"]