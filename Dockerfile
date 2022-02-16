FROM nginx:latest
ARG value=80
MAINTAINER: yakhub
RUN apt-get update && apt-get install curl -y
RUN mkdir Dir1
VOLUME ["/storage 1"]
WORKDIR /Dir1
ADD tar.myfiles.gz /Dir1
PORT ${value}
COPY sample.txt /Dir1
ENV USER=dummyuser