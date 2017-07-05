# Agario Docker Container
## Aufgabe 1
Erstelle einen Docker Container für einen Agario Server. Dafür kannst du den Agario-Server Klon MultiOgar-Edited beim Container Bauen von dieser [URL][MultiOgar Download] herunterladen.

### Tipps
* Das Basisimage ist bereits im Dockerfile angegeben und stellt Node.js zur Verfügung.
* Die Ports für den Agario Server sind 443 TCP (Gameserver) und 88 TCP (Stats Server)
	* Der Port 443 kann auf der Host Seite gegen einen anderen Port getauscht werden, z.B. 8443 (-p 8443:443).

### Ziel
Der Server muss auf Port 443 und 88 laufen und von aussen erreichbar sein.

## Aufgabe 2
Sorge dafür, dass man dem Server beim Starten eine Spielergeschwindigkeit (playerSpeed), eine Welcome Message und maximale Connections von der gleichen IP Adresse mitgeben kann.

### Tipps
- Um den Server zu konfigurieren muss im **$OGAR_HOME/src** Verzeichnis die Datei gameserver.ini liegen, die unter src/gameserver.ini für Dich bereit liegt. Die Beschreibung der einzelnen Attribute findest du direkt in der beigefügten gameserver.ini Datei.

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
Sorge dafür, dass die flüchtigen Daten, wie die logs in einem Volume gespeichert werden und damit beim erneuten Aufsetzen des Containers nicht verschwinden.

### Tipps
- Die logs liegen nach dem ersten Start im Unterverzeichnis **$OGAR_HOME/src/logs**.

[MultiOgar Download]: https://github.com/Megabyte918/MultiOgar-Edited/archive/master.zip 