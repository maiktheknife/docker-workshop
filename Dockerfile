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
# install dependencies 
RUN apt-get update && apt-get install -y\
  gettext-base \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /opt/minecraft
RUN curl -Lo minecraft_server.jar ${MC_URL}
COPY src/server.properties server.properties.template
COPY src/run.sh .
RUN chmod +x run.sh
RUN echo "eula=true" > eula.txt
EXPOSE 25565
EXPOSE 25565/udp
CMD ./run.sh