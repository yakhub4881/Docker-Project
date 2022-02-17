FROM nginx:latest
ARG value=80
MAINTAINER yakhub
RUN apt-get update && apt-get install curl -y
RUN mkdir dummydir
VOLUME ["/storage 1"]
WORKDIR /dummydir
EXPOSE ${value}
ENV USER=dummyuser