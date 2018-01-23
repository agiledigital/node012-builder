#
# Node 0.12 Build Image
# Docker image with libraries and tools as required for building NodeJS 0.12 projects using Grunt 
#

FROM mhart/alpine-node:0.12.18
MAINTAINER Agile Digital <info@agiledigital.com.au>
LABEL Description="Docker image with libraries and tools as required for building NodeJS 0.12 projects using Grunt" Vendor="Agile Digital" Version="0.1"

ENV HOME /home/jenkins

RUN apk add --update --no-cache git bash openjdk8-jre curl
RUN addgroup -S -g 10000 jenkins
RUN adduser -S -u 10000 -h $HOME -G jenkins jenkins

# No support out of the box for phantomjs
RUN curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/2.1.1a/dockerized-phantomjs.tar.gz" | tar xz -C /

WORKDIR /home/jenkins

RUN npm install -g bower@1.8.2 grunt-cli@1.2.0

ENV FONTCONFIG_PATH=/etc/fonts
ADD fonts.conf /etc/fonts/fonts.conf

USER jenkins