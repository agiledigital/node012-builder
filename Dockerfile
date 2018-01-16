#
# Grunt Node 0.12 Build Image
# Docker image with libraries and tools as required for building NodeJS 0.12 projects using Grunt 
#

FROM mhart/alpine-node:0.12
MAINTAINER Agile Digital <info@agiledigital.com.au>
LABEL Description="Docker image with libraries and tools as required for building NodeJS 0.12 projects using Grunt" Vendor="Agile Digital" Version="0.1"

ENV HOME /home/agilist
RUN addgroup -S -g 10000 agilist
RUN adduser -S -u 10000 -h $HOME -G agilist agilist

WORKDIR /home/agilist

RUN npm install -g bower grunt-cli

ADD confy-assembly-2.3.jar /usr/share/agilist/

USER agilist