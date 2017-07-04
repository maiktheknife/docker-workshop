# Minecraft Docker Container
## Aufgabe 1
Erstelle einen Docker Container für einen Minecraft Server. Dafür kannst du den Minecraft-Server beim Container Bauen von dieser [URL][Minecraft Download] herunterladen.

### Tipps
* Das Basisimage ist bereits im Dockerfile angegeben und stellt Java zur Verfügung.
* Damit der Server startet muss sich im gleichen Verzeichnis wie die .jar Datei eine Datei namens "eula.txt" mit dem Inhalt "eula=true" befinden!
* Die Ports für den Minecraft Server sind 25565 TCP und 25565 UDP

### Ziel
Der Server muss auf Port 25565 laufen und von aussen erreichbar sein.

## Aufgabe 2
Sorge dafür, dass man dem Server beim Starten einen Schwierigkeitsgrad, die MOTD und den Gamemode mitgeben kann. Schaffe eine Möglichkeit die Speichereinstellungen von Java dem Startprozess zu übergeben.

### Tipps
- Um den Server zu konfigurieren muss im selben Verzeichnis wie die .jar Datei eine Datei namens "server.properties" liegen. Benutze dafür als Ausgangspunkt die Datei im src/ Ordner. Die Beschreibung der einzelnen Attribute findest du auf [server.properties Beschreibung].

- Möglichkeiten in einer Datei Werte zu ersetzen wären zum Beispiel:
	- Mit **envsubst** lassen sich Bash Variablen ersetzen. **envsubst** befindet sich im Paket **gettext-base**.
	- Mit **sed** lassen sich einfach Strings in einer Datei über die Kommandozeile ersetzen.

#### Beispiel envsubst
``` shell
envsubst < INPUT > OUTPUT
```

#### Beispiel sed
``` shell
sed -i 's/example_key=value/example_key=new_value/g' banana.txt
```

## Aufgabe 3
Sorge dafür, dass die flüchtigen Daten, wie die Spielwelt in einem Volume gespeichert werden und damit beim erneuten Aufsetzen des Containers nicht verschwinden.

### Tipps
- Die Minecraft-Welt liegt nach dem ersten Start im Unterverzeichnis **world** vom Server

## Aufgabe 4 (optional)
Mods!!! Installiere eine Mod.
Installiere die Mod entweder bereits beim Build oder für Bonuspunkte beim Run. Wenn du die Mod erst beim Run installierst, prüfe dass die Mod nicht bereits installiert ist.

[Minecraft Download]: https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar 
[server.properties Beschreibung]: http://minecraft-de.gamepedia.com/Server.properties