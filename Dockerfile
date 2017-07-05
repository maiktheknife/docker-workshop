###########################################################
# Team Fortress 2 Game Server Image
# Debian Version
###########################################################

FROM debian:jessie

LABEL maintainer.author1="Sebastian May <sebastian.may@adesso.de>" \
      maintainer.author2="Patrick Selge <patrick.selge@adesso.de>" \
      version="1.0" \
      description="SteamCMD Game Server"

# variables
ENV STCMD_URL "http://media.steampowered.com/client/steamcmd_linux.tar.gz"
ENV STCMD_HOME "/opt/steamcmd"

# build variables
ARG GAME="tf"

# runtime variables
ENV TIMELIMIT "30" 
ENV MOTD "Welcome to our adesso Workshop SteamCMD  Server!"
ENV MAX_PLAYERS "20"
ENV MAX_ROUNDS "3"

# install dependencies 
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y\
    curl \
    libstdc++6:i386 \
    libtinfo5:i386 \
  	libcurl3-gnutls:i386 \
  	libncurses5:i386 \
  	libgcc1:i386 \
  	libz1:i386 \
  	libncurses5:i386 \
    gettext-base \
    net-tools \
  && rm -rf /var/lib/apt/lists/*

# set the workdir
WORKDIR $STCMD_HOME

# download steamcmd
RUN curl -L ${STCMD_URL} | tar xvz

# copy the SteamCmd profile
COPY src/app_ds.txt app_ds.txt.template

# execute the game choser
COPY src/install_game.sh .
RUN chmod +x install_game.sh && \
    ./install_game.sh

# run SteamCmd to install the game
RUN ./steamcmd.sh +runscript app_ds.txt

# copy over the server configuration
COPY src/server.cfg ./game/${GAME}/cfg/

# link the steam libraries
RUN ln -s "${STCMD_HOME}/linux32" "${HOME}/.steam/sdk32"

# expose the ports
EXPOSE 27015
EXPOSE 27015/udp

# copy the motd template
COPY src/motd_text_default.txt motd_text_default.txt.template

# copy the run script
COPY src/run.sh run.sh.template
RUN envsubst < run.sh.template > run.sh && \
    chmod +x run.sh

# run the game server
ENTRYPOINT ["./run.sh"]