# adesso Docker Workshop Juli 2017
Willkommen beim [adesso] Docker Workshop Juli 2017.
Nach einer kurzen Einführung in die Docker Technologien, geht es hier weiter im Hands-On Teil. Ziel dieses Workshops soll es sein, dass Gruppen aus jeweils zwei Entwicklern einen Docker Game Server erstellen. Zu diesem Zweck stehen Euch eine Reihe an Aufgaben und vorgeschlagenen Lösungen zur Verfügung, die Euch beim ersten Umgang mit Docker unterstützen sollen.

Da wir wissen, dass einen die Fülle an neuen API Calls erschlagen kann, haben wir Euch hier eine Reihe an Ressourcen zusammengestellen, die Euch bei der Ausarbeitung helfen sollen.

* [Die Präsentation zu diesem Workshop][adesso-docker-workshop-presentation]
* [Linux Cheat Sheet]
* [Dockerfile Cheat Sheet]
* [Docker Command Cheat Sheet]
* [Beispiel Development Workflow]
* [Docker Dokumentation]

## Aufbau
Dieses Repository ist in verschiedene Branches aufgeteilt, die Euch einen schnellen Einstieg ermöglichen sollen.
Es empfielt sich das Repository zunächst zu via github zu forken oder sich einen Klon zu erstellen.

Das Repository kommt mit Vorlagen, Aufgaben und Lösungsvorschlägen für die folgenden Spiele:

* Enemy Territory (*enemy-territory*)
* Agario (*agario*)
* Team Fortress 2 (*team-fortress-2*)
* Minecraft (*minecraft*)

Zu jedem dieser Spiele existieren zwei Branches
- *aufgabe-$(spielname)*
- *loesung-$(spielname)*

, wobei *$(spielname)* dem [Slug] entspricht, der in Klammern hinter dem jeweiligen Spiel oben aufgelistet ist (z.B. *aufgabe-enemy-territory* und *loesung-enemy-territory*). Diese Branches könnt ihr auf eurer Kommandozeile mit folgendem Befehl öffnen.
``` shell
git checkout aufgabe-enemy-territory
```

Im **Aufgaben Branch** befindet sich in der jeweiligen **README.md** eine Liste von kleinen Aufgaben und Beschreibungen, die zur Implementierung des Game Servers führen sollen.<br />
Für besonders schnelle Gruppen, gibt es zusätzlich noch Ideen und Anregungen zur Weiterentwicklung der Images.

 Die **Lösung Branches** zeigen Lösungsansätze auf, die wir uns erdacht haben. Hier könnt Ihr nachsehen, wenn Ihr nach dem Workshop etwas nachbauen wollt und einmal festhängt oder einfach nur einen der Game Server starten wollt.

## Hinweise

### text file busy
Es kann auf dem Server passieren dass bei einem "docker build" Aufruf die
Fehlermeldung "text file busy" kommt und der Build abbricht. Das ist ein Problem
mit dem darunterliegenden Filesystem. In aller Regel funktioniert der build dann
beim 2. Lauf.


[adesso]: https://www.adesso.de
[adesso-docker-workshop-presentation]: https://rawgit.com/matuschewski-schulze/docker-workshop/master/presentation/docker.html
[Linux Cheat Sheet]: linux-cheatsheet.md
[Docker Command Cheat Sheet]: docker-cmd-cheatsheet.md
[Dockerfile Cheat Sheet]: dockerfile-cheatsheet.md
[Beispiel Development Workflow]: example/basic-workflow.md
[Docker Dokumentation]: https://docs.docker.com/
[Slug]: https://en.wikipedia.org/wiki/Semantic_URL#Slug
