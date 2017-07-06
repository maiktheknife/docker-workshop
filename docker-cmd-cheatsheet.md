## Docker Console Commands

### `docker <command> --help`
Zeigt eine Auflistung verfügbarer Docker Kommandos und Optionen
### `docker ps` 
Zeigt die aktuell laufenden Container (-a zeigt auch nicht-laufende Container)
```shell
[~] docker ps -a
CONTAINER ID        IMAGE                             COMMAND                  CREATED             STATUS                    PORTS               NAMES
a6f69988a975        centos7                           "/usr/sbin/sshd -D"      4 days ago          Exited (0) 4 days ago                         sharp_archimedes
8037ef7610f9        jitsicompose_prosody              "echo 'hello world'"     5 days ago          Exited (0) 5 days ago                         jitsicompose_prosody_run_1

```
### `docker build -t <tag name> .`
Baut ein neues Docker Image mit dem Tag <tag name> im aktuellen Verzeichnis, in dem das Dockerfile liegt
```shell
[~] docker build -t my-server .
Sending build context to Docker daemon  2.048kB
Step 1/1 : FROM debian:jessie
jessie: Pulling from library/debian
Status: Downloaded newer image for debian:jessie
 ---> 62a932a5c143
Successfully built 62a932a5c143
Successfully tagged my-server:latest

```
### `docker run <options> IMAGE <command>` 
Führt den Befehl <command> in einem neuen Container basierend auf dem IMAGE aus. Die Optionen "-ti" werden benötigt wenn man einen interaktiven Prozess im Vordergrund startet (z.B. eine shell). Mit der Option "-d" wird der Container im Hintergrund gestartet. Ohne <command> wird das Standardkommando des Images (CMD bzw. ENTRYPOINT im Dockerfile) ausgeführt.
#### Container im Hintergrund starten
Mit der Option "-d" startet der Container im Hintergrund:
```shell
[~] docker run -d my-server
559d1d05b5f29e08eeb8dfb592c2444b733f7c88ba56c45b7e832de08f3f5004
```

#### Container starten und Ports aus dem Container zur Verfügung stellen
Mit der Option "-p <lokaler Port>:<Port im Container>" lassen sich Ports aus dem Container nach draussen reichen.
Um zum Beispiel den im Container verfügbaren Port 8080 (laut EXPOSE command im Dockerfile) lokal unter Port 80 verfügbar machen möchte, muss 
der Container so gestartet werden:
```shell
[~] docker run -p 80:8080 my-server
559d1d05b5f29e08eeb8dfb592c2444b733f7c88ba56c45b7e832de08f3f5004
```
Ohne die 1. Portangabe wird Docker sich einen zufälligen Port aussuchen. Diesen sieht man dann mit `docker ps` oder `docker inspect <container id>`.

#### Container mit einem alternativen Kommando starten
Möchte man statt dem "CMD" aus dem Dockerfile einen anderen Befehl beim starten des Containers verwenden, kann man diesen mitgeben:
```shell
[~] docker run -ti my-server /bin/bash
# <öffnet eine Shell im Container>
```
Dies kann verwendet werden um Probleme mit dem CMD zu debuggen oder sich direkt in eine Shell einzuklinken.

### `docker exec <options> CONTAINER COMMAND`
Führt den angegebenen Befehl in einem laufenden Container aus. Exec wird oftmals dafür verwendet um sich in einen laufen Container "einzuklinken" und dort eine Shell zu öffnen. Für ein interaktives Kommando (wie die Shell) muss die Option -ti gesetzt werden.
```shell
[~] docker exec -ti my-container /bin/bash
[root@559d1d05b5f2 /]#
```

### `docker stop  <container ID oder Name>` 
Beendet einen laufenden Container. Wartet standardmäßig 10 Sekunden bis der Container gekillt wird.
```shell
[~] docker stop trusting_edison
 trusting_edison
 
```
