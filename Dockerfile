###########################################################
# Aufgabe: Minecraft Game Server Image
###########################################################
FROM java:openjdk-8-jre

# variables
ENV MC_URL "https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar" 

# 1.1 Arbeitsverzeichnis setzen
# 1.2 minecraft.jar runterladen
# 1.3 Akzeptiere die "EULA"

# 2.1 Kopiere deine Server Properties Datei

# 4.1 (optional) Installiere eine Mod

# 1.4 Mache die Ports für den Server bekannt
# 3.1 Definiere ein Volume (passe außerdem deinen Run Befehl an)

# 1.5 Richte das Startkommando für den Container ein
# --> 2.2 Ersetze das Startkommando durch ein Startskript, 
#		  das Parameter entgegen nimmt und sie in der Server Properties Datei ersetzt.
# --> 4.1 (optional, alternativ) Installiere eine Mod beim Starten des Containers