# Dockerfile to run 32bit kdb+ on raspberrypi
# Created by honus85

FROM resin/armv7hf-debian


MAINTAINER honus85 <github.com/honus85>
RUN [ "cross-build-start" ]
# Set Env variables for q
ENV QHOME /q
ENV PATH ${PATH}:${QHOME}/l32arm/

# Install kdb+
RUN \ 
	apt-get update && \
	apt-get install -y curl rlwrap unzip && \
	curl --silent -O kx.com/347_d0szre-fr8917_llrsT4Yle-5839sdX/3.5/linuxarm.zip && \
	unzip linuxarm.zip && \
	rm linuxarm.zip && \
	alias q='rlwrap q'
	
RUN [ "cross-build-end" ]  
WORKDIR /


