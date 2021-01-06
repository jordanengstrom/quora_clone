# CONTAINER SETUP
# pull official base images
FROM python:3.8-alpine
FROM node:15.5-alpine

# Container info
LABEL maintainer="https://github.com/jordanengstrom"

# set work directory
RUN mkdir /app
COPY . /app
WORKDIR /app

# FRONTEND SETUP
RUN cd app/quora_clone/frontend \
    && npm install \
    && npm run build \
    && cd ../../

# BACKEND SETUP
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG 0
ENV QTIME_SECRET_KEY 'foo'

# install psycopg2
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && pip install psycopg2 \
    && apk del build-deps \
    && pip install -r requirements.txt

# Specify port number
EXPOSE 8000

# run Django server
CMD python3 manage.py runserver 0.0.0.0:8000