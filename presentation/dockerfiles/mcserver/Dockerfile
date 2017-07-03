FROM openjdk:jre-alpine

#ADD https://s3.amazonaws.com/Minecraft.Download/versions/1.11.2/minecraft_server.1.11.2.jar /opt/mc/mcserver.jar
ADD minecraft_server.1.11.2.jar /opt/mc/mcserver.jar

RUN mkdir -p /opt/mc-data
RUN echo "eula=true" > /opt/mc-data/eula.txt
VOLUME /opt/mc-data
EXPOSE 25565
WORKDIR /opt/mc-data
CMD java -Xmx1024M -Xms1024M -jar /opt/mc/mcserver.jar nogui
