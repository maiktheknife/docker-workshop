###########################################################
# Minecraft Game Server Image
# Debian Version
###########################################################

FROM java:openjdk-8-jre

LABEL maintainer.author1="Sebastian May <sebastian.may@adesso.de>" \
      maintainer.author2="Patrick Selge <patrick.selge@adesso.de>" \
      version="1.0" \
      description="Minecraft Game Server"

# variables
ENV MC_URL "https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar" 
ENV MC_HOME "/opt/minecraft"

# build arguments
ARG FTB_MOD=""

# runtime variables
ENV MOTD "Minecraft Server"
ENV DIFFICULTY "1"
ENV GAMEMODE "0"
ENV JVM_MEMORY "1024M"

# install dependencies 
RUN apt-get update && apt-get install -y\
  gettext-base \
  && rm -rf /var/lib/apt/lists/*

# set workdir
WORKDIR "${MC_HOME}"

# expose a volume
VOLUME "${MC_HOME}/world"

# copy properties
COPY src/server.properties server.properties.template
COPY src/run.sh .
COPY src/install.sh .

RUN chmod +x run.sh && \
    chmod +x install.sh && \
    ./install.sh

# expose ports
EXPOSE 25565
EXPOSE 25565/udp

# run minecraft
CMD ./run.sh