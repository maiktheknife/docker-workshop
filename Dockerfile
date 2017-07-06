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
ENV OGAR_HOME "/opt/ogar"

# install dependencies 
RUN apt-get update && apt-get install -y\
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

# install Ogar
RUN curl -Lo ogar.zip ${OGAR_URL} && \
	unzip ogar.zip -d /opt && \
	mv /opt/MultiOgar-Edited-master "${OGAR_HOME}" && \
	rm -rf ogar.zip 

# change the workdir to the ogar home
WORKDIR "${OGAR_HOME}"

# install dependencies through npm
RUN	npm install

# change to ogars src directory
WORKDIR "${OGAR_HOME}/src"

# expose ports
EXPOSE 88
EXPOSE 443

# run the server
CMD node index.js