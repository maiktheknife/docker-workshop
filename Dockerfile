###########################################################
# Aufgabe: Minecraft Game Server Image
###########################################################
FROM java:openjdk-8-jre

# variables
ENV MC_URL "https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar" 

ARG GAMEMODE=0
ARG DIFFICULTY=1
ARG MOTD="Hello from Docker"

# 1.1 Arbeitsverzeichnis setzen
# 1.2 minecraft.jar runterladen
# 1.3 Akzeptiere die "EULA"
# RUN mkdir -p minecraft
WORKDIR minecraft

RUN curl -L -o mincraft_server.jar $MC_URL
RUN echo "eula=true" > eula.txt

# 2.1 Kopiere deine Server Properties Datei
ADD src src

# 4.1 (optional) Installiere eine Mod

# 1.4 Mache die Ports für den Server bekannt
EXPOSE 25565

# 3.1 Definiere ein Volume (passe außerdem deinen Run Befehl an)
VOLUME /home/docker-7/minecraft/world

# 1.5 Richte das Startkommando für den Container ein
# --> 2.2 Ersetze das Startkommando durch ein Startskript,
#   das Parameter entgegen nimmt und sie in der Server Properties Datei ersetzt.
CMD start.sh $GAMEMODE $DIFFICULTY $MOTD

# --> 4.1 (optional, alternativ) Installiere eine Mod beim Starten des Containers











