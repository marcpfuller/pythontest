# Dockerfile

FROM ubuntu:20.04
MAINTAINER johndoe@gmail.com


RUN apt update && apt install -y sbcl


WORKDIR /usr/src