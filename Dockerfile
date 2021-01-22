FROM ubuntu:latest

COPY . /app

WORKDIR /app

RUN ls -la