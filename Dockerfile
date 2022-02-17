FROM nginx:latest
ARG value=80
MAINTAINER yakhub
RUN apt-get update && apt-get install curl -y
RUN mkdir dummydir
VOLUME ["/storage 1"]
WORKDIR /dummydir
ADD myfiles.tar.gz /dummydir
EXPOSE ${value}
COPY sample.txt /dummydir
ENV USER=dummyuser