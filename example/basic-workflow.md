Basic Development Workflow
Um ein Docker Image "from scratch" aufzubauen empfiehlt sich zum Beispiel folgende Vorgehensweise:


# Basisimage
Überlege dir welche Pakete und welches Basisbetriebssystem du für deine vermutlich Software benötigen wirst.

Suche dazu ein passendes Basisimage auf hub.docker.com. Beispiele für Basisimages wären folgende:

1.  debian - wenn du vorher schon weisst dass du .deb Paket installieren musst empfiehlt sich das Image

    Das Image bietet viele Varianten als Tags an:
    
    -   debian:stretch für das "stretch" Release
    -   debian:stable für das aktuelle stable Release
    -   debian:stable-slim für eine minimale Version des stables releases
    -   etc&#x2026;

2.  centos - wenn du rpm Pakete benötigen wirst

    Auch hier gibt es Tags für die unterschiedlichen Versionen:
    
    -   centos:centos6 für CentOS 6
    -   centos:centos7 für CentOS 7

3.  alpine - wenn du keine großen Abhängigkeiten hast empfiehlt sich dieses besonders minimals Basisimage (es ist nur 5 MB groß!)

4.  jdk, jenkins, etc.

    Für die meiste Software gibt es mittlerweile schon vorgefertigte
    Dockerimages die oft selbst eines der vorherigen Images als Basisimage verwenden.
    Für ein Image, welches sowieso ein JDK8 benötigt könntest du also zum Beispiel direkt das Image java:8-jdk-alpine verwenden. Eine gute Bezugsquelle hierfür ist [Docker Hub](https://hub.docker.com/).


# Dockerfile erstellen
Erstelle ein Verzeichnis und lege darin ein Dockerfile an.

Für ein Debian "stretch" Basisimage also das folgende Dockerfile:

```shell
FROM debian:stretch
```

# baue das Basisimage

Anschliessend kannst du aus dem gleichen Verzeichnis heraus das Basisimage bauen:

```shell
[~] docker build -t my-software .
```

Damit entsteht ein Image namens "my-software" das nichts weiter als eine Debian Installation enthält.


# Shell im leeren Container
öffne eine root-shell in dem "leeren" Container.

Um zu deinem Ziel zu kommen, musst du nun Software installieren, Dateien
herunterladen, etc. Damit du nicht raten musst wie die Befehle in Debian
heissen und ob sie verfügbar sind, öffnest du einfach eine Shell in dem
leeren Container, installierst deine Abhängigkeiten und schreibst dabei mit
welche Befehle in welcher Reihenfolge benötigt werden:

```shell
[~] docker run --name my-container -ti my-software /bin/bash
[root@2139qwj] apt update
[root@2139qwj] apt search stdc++
libstdc++6/stable,now 6.3.0-18 amd64
GNU-Implementierung der Standard-C++-Bibliothek (Version 3)
…
[root@2139qwj] apt install -y libstdc++6
```

# Erste Änderungen am Dockerfile
Erweitere dein Dockerfile um die aufgeschriebenen, notwendigen Befehle.

Wenn du ein paar Befehle zusammen hast um deine Container zum Laufen zu kriegen, füge diese in dein Dockerfile ein<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup>:

```shell
[~] pico Dockerfile
```

Der Inhalt des Dockerfiles ist in diesem Beispiel dann:

```shell
FROM debian:stretch
RUN apt update && apt install -y libstdc++6 && apt clean
```

# Image Update

Danach musst du das Image nochmal bauen, damit deine Änderungen in das Image kommen:

```shell
[~] docker build -t my-software .
```

# Container Neustart

Um den Container wieder zu starten und in eine Shell zu kommen, musst du ihn vorher entfernen:

```shell
[~] docker rm -f my-container
```

Und danach kannst du den Container wieder starten:

```shell
[~] docker run --name my-container -ti my-software /bin/bash
```

# Und so weiter…

Anschliessend wiederholst du das "Einloggen, Ausführen, Aufschreiben, Anpassen, Neubauen" bis dein Image fertig ist.
Dabei werden natürlich nicht nur "RUN" Docker-Befehle dazu kommen und am Ende sollte zumindest ein "CMD" im Dockerfile stehen :-)


# Fu&szlig;noten

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Es ist best practice seine Images so klein wie möglich zu halten und bei
jedem Schritt im Dockerfile nicht benötigte temporäre Dateien wieder zu
entfernen damit die einzelnen Layer klein bleiben!
