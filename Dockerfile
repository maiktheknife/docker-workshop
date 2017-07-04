###########################################################
# ET: Legacy Game Server Image
# Debian Version
###########################################################

FROM buildpack-deps:jessie

LABEL maintainer.author1="Sebastian May <sebastian.may@adesso.de>" \
      maintainer.author2="Patrick Selge <patrick.selge@adesso.de>" \
      version="1.0" \
      description="Enemy Territory Legacy Game Server"

ARG PASSWD=etlegacy

# variables
ENV ETLEGACY_URL "https://www.etlegacy.com/download/file/87" 
ENV WS_ASSETS_URL "http://filebase.trackbase.net/et/full/et260b.x86_full.zip"


# install dependencies 
RUN apt-get update && apt-get install -y\
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*


# install ET: Legacy
RUN curl -L ${ETLEGACY_URL} | tar xvz && \
    mv etlegacy-* etlegacy
    

# install Wolfenstein Assets
RUN curl -Lo ws_assets.zip ${WS_ASSETS_URL} && \
    unzip ws_assets.zip && \
    ./et260b.x86_keygen_V03.run --noexec --target et260b


RUN mv et260b/etmain/pak*.pk3 etlegacy/etmain && \
    rm -rf ws_assets et260b ws_assets.zip et260b.x86_keygeb_V03.run

# configure ET: Legacy Server
RUN echo "set rconpassword \"${PASSWD}\"" >> etlegacy/etmain/etl_server.cfg 

# exposed ports
EXPOSE 27690/udp

USER root

WORKDIR /etlegacy
ENTRYPOINT ./etlded_bot.sh
