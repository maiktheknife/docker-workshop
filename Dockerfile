###########################################################
# Aufgabe: ET: Legacy Game Server Image
###########################################################

FROM buildpack-deps:jessie

# variables
ENV ETLEGACY_URL "https://www.etlegacy.com/download/file/87" 
ENV WS_ASSETS_URL "http://filebase.trackbase.net/et/full/et260b.x86_full.zip"


# install dependencies 
RUN apt-get update && apt-get install -y\
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*


# 1.1 downloade und installiere ET: Legacy
# 1.2 downloade und installiere die ET: Legacy Assets

# 2.1 konfiguriere den ET Legacy Server

# 1.3 konfiguriere die Ports

# 3.1 konfiguriere die Volumes

# 1.4 setze das Arbeitsverzeichnis
# 1.5 starte Enemy Territory