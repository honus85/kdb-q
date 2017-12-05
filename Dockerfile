# Dockerfile to run 32bit kdb+ on raspberrypi
# Created by honus85

FROM resin/armv7hf-debian


MAINTAINER honus85 <github.com/honus85>
# Set Env variables for q
ENV QHOME /q
ENV PATH ${PATH}:${QHOME}/l32arm/

RUN [ "cross-build-start" ]
# Install kdb+
RUN apt-get update
RUN apt-get install -y curl rlwrap unzip
RUN curl --silent -O kx.com/347_d0szre-fr8917_llrsT4Yle-5839sdX/3.5/linuxarm.zip
RUN unzip linuxarm.zip
RUN rm linuxarm.zip
RUN alias q='rlwrap q'
RUN q
	
RUN [ "cross-build-end" ]  
WORKDIR /


