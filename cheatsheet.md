# Cheatsheet 

## Linux Commands

### `pwd` - gibt das aktuelle Verzeichnis aus, in dem man sich befindet

```shell
[~] pwd
 /home/sebastian
```

### `mkdir <Verzeichnis>`
- legt ein Verzeichnis an

```shell
[~] mkdir /tmp/docker-test
```

### `cd <Verzeichnis>` - *C*hange *D*irectory, wechselt in das angegebene Verzeichnis

```shell
[~] cd /tmp/docker-test
[~] pwd
/tmp/docker-test
```

### `pico <Dateiname>` - einfacher Texteditor (Ctrl-X zum Verlassen, Ctrl-S zum Speichern)

```shell
[~] pico Dockerfile
```

* `vim <Dateiname>` - komplizierter Texteditor (falls du vim nicht kennst, solltest du es jetzt nicht zu lernen anfangen)

* `ls -la` - zeigt den Inhalt des aktuellen Verzeichnisses

```shell
[~] ls -la
 insgesamt 4
 drwxr-xr-x  2 sebastian sebastian   23 Jul  5 10:30 .
 drwxrwxrwt 19 root      root      4096 Jul  5 10:30 ..
 -rw-r--r--  1 sebastian sebastian    0 Jul  5 10:30 Dockerfile

```
* `cp <Quelle> <Ziel>` - Kopiert Dateien von Quelle nach Ziel
```shell
[~] cp Dockerfile Dockerfile.backup
```
* `mv <Quelle> <Ziel>` - Verschiebt Dateien/Verzeichnisse von Quelle nach Ziel
```shell
[~] mv /tmp/docker-test /tmp/docker-repo
```

## Docker Console Commands

* `docker <command> --help` - zeigt eine Auflistung verfügbarer Docker Kommandos und Optionen
* `docker ps` - zeigt die aktuell laufenden Container (-a zeigt auch nicht-laufende Container)
```shell
[~] docker ps -a
CONTAINER ID        IMAGE                             COMMAND                  CREATED             STATUS                    PORTS               NAMES
a6f69988a975        centos7                           "/usr/sbin/sshd -D"      4 days ago          Exited (0) 4 days ago                         sharp_archimedes
8037ef7610f9        jitsicompose_prosody              "echo 'hello world'"     5 days ago          Exited (0) 5 days ago                         jitsicompose_prosody_run_1

```
* `docker build -t <tag name> .` - baut ein neues Docker Image mit dem Tag <tag name> im aktuellen Verzeichnis, in dem das Dockerfile liegt
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
* `docker run <options> IMAGE <command>` - Führt den Befehl <command> in einem neuen Container basierend auf dem IMAGE aus. Die Optionen "-ti" werden benötigt wenn man einen interaktiven Prozess im Vordergrund startet (z.B. eine shell). Mit der Option "-d" wird der Container im Hintergrund gestartet. Ohne <command> wird das Standardkommando des Images (CMD bzw. ENTRYPOINT im Dockerfile) ausgeführt.
```shell
[~] docker run -ti my-server /bin/bash
 root@963c5e13cdec:/#
<shell im Container öffnet sich>
```

* `docker stop  <container ID oder Name>` - beendet einen laufenden Container. Wartet standardmäßig 10 Sekunden bis der Container gekillt wird.
```shell
[~] docker stop trusting_edison
 trusting_edison
 
```

