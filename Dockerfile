# CONTAINER SETUP
# pull official base images
FROM python:3.8-slim
FROM node:15.5-slim

# Container info
LABEL maintainer="https://github.com/jordanengstrom"

# set work directory
RUN mkdir /app
COPY ./quora_clone /app/
WORKDIR /app

# FRONTEND SETUP
RUN cd frontend \
    && npm install \
    && npm run build \
    && cd ../

# BACKEND SETUP
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG 0
ENV QTIME_SECRET_KEY 'foo'

# install psycopg2
RUN apt-get -y update \
    && apt-get install -y python3-pip python3-dev -y \
#    && apt-get install -y postgresql postgresql-contrib \
    && python3 -m pip install --upgrade pip \
    && pip3 install wheel \
#    && pip3 install psycopg2 \
    && pip3 install -r requirements.txt

RUN python3 manage.py makemigrations && python3 manage.py migrate
RUN python3 manage.py collectstatic --no-input

# Specify port number
EXPOSE 8000

# run Django server
CMD python3 manage.py runserver 0.0.0.0:8000