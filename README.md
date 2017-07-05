# Team Fortress 2 Docker Container
## Aufgabe 1
Erstelle einen Docker Container für einen Team Fortress 2 Server. Hierfür benötigst Du das Tool SteamCmd, das unter [http://media.steampowered.com/client/steamcmd_linux.tar.gz](http://media.steampowered.com/client/steamcmd_linux.tar.gz) heruntergeladen werden kann.

### Tipps
* Das Basisimage ist bereits im Dockerfile angegeben.
* Die Dependencies sind bereits alle im Dockerfile konfiguriert und können so übernommen werden.
* SteamCmd wird über ein Profil mitgeteilt, welche Software installiert werden soll. Für Team Fortress 2, wird die AppId 232250 verwendet.
* Die Ports für den Team Fortress 2 Server sind 27015 TCP und 27015 UDP
* Steam verträgt sich unter Umständen nicht mit docker-compose. Bitte benutzt einfach ein normales Dockerfile und die gängigen docker commands 
* Der Serverstartbefehl kann etwa so aussehen "tf2/srcds_run -game tf +sv_pure 1 +sv_lan 1 +map ctf_2fort +maxplayers 24", wobei +sv_lan 1 angibt, dass es sich um einen im Netzwerk verfügbaren Server handelt.

### Ziel
Der Server muss auf Port 27015 laufen und von aussen erreichbar sein.

## Aufgabe 2
Sorge dafür, dass man dem Server beim Starten eine Rundenzeit, die MOTD, die maximale Spieleranzahl und die maximale Rundenanzahl mitgeben kann.

### Tipps
- Um den Server zu konfigurieren muss im Unterverzeichnis tf2/tf/cfg eine Datei namens "server.cfg" liegen. Benutze dafür als Ausgangspunkt die Datei im src/ Ordner. Die Beschreibung der einzelnen Attribute findest du auf [server.cfg Beschreibung].

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
Sorge dafür, dass die flüchtigen Daten, wie die Replays in einem Volume gespeichert werden und damit beim erneuten Aufsetzen des Containers nicht verschwinden.

### Tipps
- Die Replaydaten liegen im Unterverzeichnis **tf2/tf/replay**

## Aufgabe 4 (optional)
Installiere Counter Strike: GO, basierend auf einem Buildargument.

### Tipps
- CS:GO hat die AppId **740**.
- Denke daran, dass sich dein Run Befehl oder CMD sowie die server.cfg entsprechend des ausgewählten Spiels ändern muss.

[server.cfg Beschreibung]: https://wiki.teamfortress.com/wiki/Dedicated_server_configuration
