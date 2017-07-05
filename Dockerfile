###########################################################
# Aufgabe: Team Fortress 2 Game Server Image
###########################################################

FROM debian:jessie

# variables
ENV TF2_URL "http://media.steampowered.com/client/steamcmd_linux.tar.gz" 
ENV TF2_HOME "/opt/tf2"

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
  && rm -rf /var/lib/apt/lists/*

# 4.1 (optional) Setze ein Argument, mit dem das Spiel ausgesucht werden kann

# 1.1 Setze das Arbeitsverzeichnis auf ${TF2_HOME}
# 1.2 Lade SteamCmd herunter und entpacke es in Dein Arbeitsverzeichnis

# 1.3 Kopiere das tf2 Profil (src/tf2_ds.txt) für SteamCmd

# 1.4 Führe SteamCmd (steamcmd.sh) aus und verweise dabei auf das tf2 Profil (nutze hierfür das Argument +runscript "scriptname")
# --> 4.2 (optional) verweise basierend auf Deinem Spielargument auf das entsprechende Profil

# 3.1 definiere das Volume für die Replays

# 1.5 Kopiere die Server Konfiguration (src/server.cfg) in den TF2 Konfigurationsordner (./tf2/tf/cfg)
# --> 4.2 (optional) verweise basierend auf Deinem Spielargument auf die entsprechende Konfiguration

# 1.6 Linke das Steam Library Verzeichnis ("${TF2_HOME}/linux32") nach "${HOME}/.steam/sdk32"

# 1.7 Gebe die Ports frei (27015 TCP und 27015 UDP)

# 1.8 Konfiguriere das Startskript
# --> 2.1 verändere die Konfiguration oder das Startskript, entsprechend der übergebenen Run Argumente
# --> 4.3 (optional) Konfiguriere das Startskript entsprechend Deines Spielarguments