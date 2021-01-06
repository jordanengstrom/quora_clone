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
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add py3-pip \
    && apk add postgresql-dev \
    && python3 -m pip install --upgrade pip \
    && pip3 install wheel \
    && pip3 install psycopg2 \
    && pip3 install -r requirements.txt \
    && apk del build-deps

# Specify port number
EXPOSE 8000

# run Django server
CMD python3 manage.py runserver 0.0.0.0:8000