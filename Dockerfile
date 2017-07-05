###########################################################
# Aufgabe: Agario Clone Game Server Image (MultiOgar-Edited)
###########################################################

FROM node:8

# variables
ENV OGAR_URL "https://github.com/Megabyte918/MultiOgar-Edited/archive/master.zip" 
ENV OGAR_HOME "/opt/ogar"

# install dependencies 
RUN apt-get update && apt-get install -y\
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

# 1.1 Downloade und entpacke Ogar

# 1.2 Setze das Arbeitsverzeichnis auf "${OGAR_HOME}"
# 1.3 Installiere die Dependencies via npm install

# 2.1 Installiere die Konfiguration

# 3.1 Konfiguriere das Logs Volume

# 1.4 Setze das Arbeitsverzeichnis auf das "${OGAR_HOME}/src" Directory
# 1.5 Starte die Anwendung mit node index.js