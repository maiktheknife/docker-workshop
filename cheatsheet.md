# Cheatsheet 

## Linux Commands

### `pwd`
Gibt das aktuelle Verzeichnis aus, in dem man sich befindet.

```shell
[~] pwd
 /home/sebastian
```

### `mkdir -p <Verzeichnis>`
Legt ein Verzeichnis an

```shell
[~] mkdir -p /tmp/docker-test
```

### `cd <Verzeichnis>`
**C**hange **D**irectory, wechselt in das angegebene Verzeichnis

```shell
[~] cd /tmp/docker-test
[~] pwd
/tmp/docker-test
```

### `pico <Dateiname>`
Einfacher Texteditor (Ctrl-X zum Verlassen, Ctrl-S zum Speichern).

```shell
[~] pico Dockerfile
```

### `vim <Dateiname>`
Komplizierter Texteditor (falls du vim nicht kennst, solltest du es jetzt nicht zu lernen anfangen)

### `ls -la`
Zeigt den Inhalt des aktuellen Verzeichnisses

```shell
[~] ls -la
 insgesamt 4
 drwxr-xr-x  2 sebastian sebastian   23 Jul  5 10:30 .
 drwxrwxrwt 19 root      root      4096 Jul  5 10:30 ..
 -rw-r--r--  1 sebastian sebastian    0 Jul  5 10:30 Dockerfile

```
### `cp <Quelle> <Ziel>`
Kopiert Dateien von Quelle nach Ziel
```shell
[~] cp Dockerfile Dockerfile.backup
```
### `mv <Quelle> <Ziel>` 
Verschiebt Dateien/Verzeichnisse von Quelle nach Ziel
```shell
[~] mv /tmp/docker-test /tmp/docker-repo
```

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
```shell
[~] docker run -d my-server
559d1d05b5f29e08eeb8dfb592c2444b733f7c88ba56c45b7e832de08f3f5004
```

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
