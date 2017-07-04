###########################################################
# Agario Clone Game Server Image (Ogar)
# Debian Version
###########################################################

FROM node:8

LABEL maintainer.author1="Sebastian May <sebastian.may@adesso.de>" \
      maintainer.author2="Patrick Selge <patrick.selge@adesso.de>" \
      version="1.0" \
      description="Agario Game Server"

# variables
ENV OGAR_URL "https://github.com/Megabyte918/MultiOgar-Edited/archive/master.zip" 

# install dependencies 
RUN apt-get update && apt-get install -y\
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

# install Ogar
RUN curl -Lo ogar.zip ${OGAR_URL} && \
	unzip ogar.zip -d /opt && \
	mv /opt/MultiOgar-Edited-master /opt/ogar && \
	rm -rf ogar.zip 

WORKDIR /opt/ogar

RUN	npm install

WORKDIR /opt/ogar/src

CMD node index.js