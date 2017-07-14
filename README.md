# Enemy Territory Docker Container
## Aufgabe 1
Erstelle einen Docker Container für einen Enemy Territory Server. Dafür kannst du den Enemy Territory-Server beim Container Bauen von dieser [URL][Enemy Territory Download] herunterladen. Zusätzlich werden die Pak Dateien von dieser [URL][Enemy Territory PAK Download] benötigt.

### Tipps
* Das Basisimage ist bereits im Dockerfile angegeben.
* Zunächst muss Enemy Territory von der [URL][Enemy Territory Download] heruntergeladen und entpackt werden.
* Zusätzlich werden die Assets von folgender [URL][Enemy Territory PAK Download] benötigt, wobei ein run-File entpackt wird, dass mit dem Befehl "./et260b.x86_keygen_V03.run --noexec --target et260b" weiter entpackt werden kann. Die hierin enthaltenen pk3 Dateien im Unterordner **et260b/etmain** müssen in das etmain Unterverzeichnis des etlegacy Ordners verschoben werden.
* Der Port für den Enemy Territory Server ist 27690 UDP

### Ziel
Der Server muss auf Port 27690 laufen und von aussen erreichbar sein.

## Aufgabe 2
Sorge dafür, dass man dem Server beim Starten einen rcon-Passwort mitgeben kann.

### Tipps
- Um den Server zu konfigurieren muss im etmain Unterverzeichnis des etlegacy Ordners eine Datei namens "etl\_server.cfg" liegen. Benutze dafür als Ausgangspunkt die Datei im src/ Ordner. Die Beschreibung der einzelnen Attribute findest Du in der beigefügten etl\_server.cfg Datei.

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


[Enemy Territory Download]: https://www.etlegacy.com/download/file/87
[Enemy Territory PAK Download]: http://filebase.trackbase.net/et/full/et260b.x86_full.zip
