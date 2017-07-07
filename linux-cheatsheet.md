# Cheatsheet 

## Linux Commands

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

### `curl`
**TODO**

### `pwd`
Gibt das aktuelle Verzeichnis aus, in dem man sich befindet.

```shell
[~] pwd
 /home/sebastian
```

### `screen` 
Oftmals wird `screen` verwendet um sich gegen unterbrochene SSH Verbindungen abzusichern.
Es öffnet eine Shell im aktuellen Verzeichnis, welche im Hintergrund bestehen bleibt, selbst
wenn man den Server verlässt.
Mit `screen -x` kann sich eine andere Person in deinen Screen einklinken und ihr "seht" euch gegenseitig.

