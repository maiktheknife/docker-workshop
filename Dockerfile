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

# runtime variables
ENV PLAYER_SPEED "1"
ENV MOTD "Willkommen auf dem adesso Agario Server"
ENV MAX_CONNECTIONS_PER_IP "15"

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

# install the configuration and the run script
COPY src/gameserver.ini .
COPY src/run.sh .
RUN chmod +x run.sh

# expose ports
EXPOSE 88
EXPOSE 443

# configure the volumes
VOLUME "${OGAR_HOME}/src/logs"

# run the server
CMD ./run.sh