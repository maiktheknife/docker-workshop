# Dockerfile Cheatsheet

## FROM <docker baseimage>

Der Startpunkt jedes Dockerfiles gibt mit FROM das Basisimage an, auf dem alle foglenden Änderungen ausgeführt werden.

Beispiel:
```Dockerfile
FROM debian:stretch
```

## WORKDIR <directory>
Das WORKDIR Kommand gibt das Verzeichnis an in dem alle folgenden Kommandos ausgeführt werden sollen.
Existiert das Verzeichnis noch nicht, wird es angelegt.
Folgende WORKDIR Kommandos können das WORKDIR wieder anders setzen.
```Dockerfile
# gib das aktuelle Verzeichnis aus
RUN pwd
# lege /tmp/test-dir an und wechsle in das Verzeichnis
WORKDIR /tmp/test-dir
# gebe wieder das aktuelle Arbeitsverzeichnis aus
RUN pwd
```

## RUN <command>

Mit RUN werden ganz normale Shell Kommandos im zu bauenden Image ausgeführt. Man kann auch mehrere Commands mit && aneinanderreihen

Beispiel:
```Dockerfile
RUN echo "Hello World"
RUN apt-get install -y emacs && apt-get clean
```

## ADD / COPY <source(s)> <destination>

Mit COPY werden Dateien aus dem Hostsystem in das Image kopiert.
Es können mehrere Quellen angegeben werden, welche zur destionation kopiert werden.
Endet die Destination mit einem / so wird die Datei in das Verzeichnis kopiert, ansonsten
wird die Datei unter dem angegebenen Zielnamen abgelegt.

Beispiele:
```Dockerfile
# Kopiere config.ini in nach config-dir/config.ini
COPY config.ini config-dir/
# Kopiere config.ini.default nach config.ini
COPY config.ini.default config.ini
```

Unterschhied ADD:
ADD entpackt optional vorhandene .tar-Archive bevor sie im Image abgelegt werden:
```Dockerfile
# Entpacke tomcat.tar.gz und lege die Dateien in /opt/tomcat/ ab
ADD tomcar.tar.gz /opt/tomcat/
```


## CMD / ENTRYPOINT

### CMD

Mit CMD wird der Befehl angegeben welche beim Starten des Containers ausgeführt wird.
Das Kommando kann an der Kommandozeile von `docker run <cmd>` überschrieben werden.

### ENTRYPOINT

Wenn der Entrypoint angegeben ist, wird er dem CMD 

## EXPOSE

## VOLUME

## LABEL

