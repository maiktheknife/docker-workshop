# Dockerfile Cheatsheet

## FROM \<docker baseimage\>

Der Startpunkt jedes Dockerfiles gibt mit FROM das Basisimage an, auf dem alle foglenden Änderungen ausgeführt werden.

Beispiel:
```Dockerfile
FROM debian:stretch
```

## WORKDIR \<directory\>
Das WORKDIR Kommand gibt das Verzeichnis an in dem alle folgenden Kommandos ausgeführt werden sollen.
Existiert das Verzeichnis noch nicht, wird es angelegt.
Folgende WORKDIR Kommandos können das WORKDIR wieder anders setzen.
```Dockerfile
# lege /tmp/test-dir an und wechsle in das Verzeichnis
WORKDIR /tmp/test-dir
```

## RUN \<command\>

Mit RUN werden ganz normale Shell Kommandos im zu bauenden Image ausgeführt. Man kann auch mehrere Commands mit && aneinanderreihen

Beispiel:
```Dockerfile
RUN echo "Hello World"
RUN apt-get install -y emacs && apt-get clean
```

## ADD / COPY \<source(s)\> \<destination\>

Mit COPY werden Dateien aus dem Hostsystem in das Image kopiert.
Es können mehrere Quellen angegeben werden, welche zur destionation kopiert werden.
Endet die Destination mit einem / so wird die Datei in das Verzeichnis kopiert, ansonsten
wird die Datei unter dem angegebenen Zielnamen abgelegt.

Beispiele:
```Dockerfile
# Kopiere config.ini in nach config-dir/config.ini
COPY config.ini config-dir/
COPY config.ini.default config.ini
```

Unterschied ADD:
ADD entpackt optional vorhandene .tar-Archive bevor sie im Image abgelegt werden:
```Dockerfile
# Entpacke tomcat.tar.gz und lege die Dateien in /opt/tomcat/ ab
ADD tomcat.tar.gz /opt/tomcat/
```
Darüber

## CMD / ENTRYPOINT

### CMD <\cmd\> | CMD ["<\cmd\>","\<cmd\>",...]

Mit CMD wird der Befehl angegeben welche beim Starten des Containers ausgeführt wird.
```Dockerfile
CMD ./run.sh start
```

Alternativ kann CMD mit der Arrayschreibweise gebaut werden (empfohlene Schreibweise).
```Dockerfile
CMD ["./run","start"]
```
Das Kommando kann an der Kommandozeile von `docker run <cmd>` überschrieben werden.

### ENTRYPOINT ["\<entrypoint\>","\<entrypoint\>",...]
Wenn der Entrypoint angegeben ist, wird er dem CMD vorangestellt. Die in Command stehenden Strings dienen dann als Arguments.
```Dockerfile
ENTRYPOINT ["./run.sh"]
CMD ["start"]
```

Anders als CMD kann ENTRYPOINT nicht einfach via `docker run <cmd>` überschrieben werden. Das überschreiben geschieht mit `docker run --entrypoint="./run2.sh" <cmd>`

### Besonderheiten bei zeitgleicher Verwendung von ENTRYPOINT und CMD
* Wird der Entrypoint überschrieben, werden die im Image unter CMD konfigurierten Argumente gelöscht und müssen manuell übergeben werden.
* Werden CMD und ENTRYPOINT zeitgleich verwendet, so muss bei beiden Befehlen die Arrayschreibweise gewählt werden.

## ENV \<key\>[=]\<value\>[ \<key\>=\<value\>...]
Mit ENV können Environmentvariablen festgelegt werden, die später mit `${VAR}` wieder ausgegeben werden können.

```Dockerfile
ENV IP 127.0.0.1
ENV HOST=www.example.org \
	HOST2=www.example2.org
```

Die Env Variablen können Key und Value mit einem Leerzeichen separieren (dann pro ENV Befehl jeweils eine Variable) oder mit Gleichheitszeichen arbeiten und pro ENV Befehl jeweils mehrere Variablen definieren.

Alle ENV Variablen (bzw. alle Environmentvariablen) können mit dem Dockerargument **--env** bzw. **-e** überschrieben / gesetzt werden.

```shell
[~] docker run -e KEY1=VAL1 --env KEY2=VAL2 docker-image
```

## ARG \<key\>[=\<defaultvalue\>]

Mit ARG können Argumente definiert werden, die beim Build mit übergeben werden können.
Hierbei können optional Defaultwerte festgelegt werden, die mit einem Gleichheitszeichen übergeben werden müssen.

```Dockerfile
ARG WELCOME_MESSAGE # defaults to ""
ARG SSL=0 # defaults to 0
```

Die Argumente werden beim Build wie folgt übergeben:
```shell
[~] docker build --build-arg KEY1=VAL1 --build-arg KEY2=VAL2 .
```

## EXPOSE \<port\>[ \<port\>...]
EXPOSE teilt Docker mit, dass der/die angegebene(n) Port(s) nach außen hin verfügbar gemacht werden sollen.

```Dockerfile
EXPOSE 80
EXPOSE 443 8080
```

Die Ports können manuell mit **-p \<hostport\>:\<containerport\>** an den Host gebunden werden. Die Ports können, müssen aber nicht alle verbunden werden. Mit der Option **-P** sucht Docker nach freien, verfügbaren Ports auf dem Host und bindet alle Ports, für die ein EXPOSE im Container existiert, hierauf.  

```shell
# legt die Ports manuell fest und gibt 443 nicht nach außen frei
[~] docker run -p 80:80 -p 3999:8080 dockerimage
# lässt Docke automatisch Ports aussuchen (beinhaltet alle Ports)
[~] docker run -P --name testcontainer dockerimage
# gebe ports des Containers aus
[~] docker ports testctainer
```

## VOLUME \<directory\>[ \<directory\>...]
Mit VOLUME werden Pfade angegeben, die von außen in den Container eingebunden werden können. Hierdurch können Dateien über den Lebenszyklus des Docker Containers auf dem Hostsystem verbleiben und stehen auch nach einem Neubau weiterhin zur verfügung.

```Dockerfile
VOLUME /data
```

Die Einbindung der Volumes erfolgt **-v** und kann auf ein Volumecontainer oder einen Hostpfad (absoluter Pfad erforderlich) verweisen.

```Dockerfile
# volume container
[~] docker run -v volcontainer:/opt/container/data image
# hostpfad (direkter Dateisystemzugriff)
[~] docker run -v /opt/host/data:/opt/container/data image
```

## USER \<user\>
Setzt den User, mit den alle folgenden Befehle ausgeführt werden (RUN, CMD, etc...)

```Dockerfile
USER jimmy
```