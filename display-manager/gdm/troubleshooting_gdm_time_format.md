---
title: GDM - Zeitformat ändern 
---

# Problem

In vielen Standardeinstellungen wird in GDM ein 12-Stunden-Zeitformat
verwendet, wodurch die Uhrzeit bspw. als "2:30 PM" Anstatt "14:30" angezeigt
wird. Bei einer deutschen Spracheinstellung kann die Uhrzeit auch als
"2:30 NACHMITTAGS" angezeigt werden. Um das 24-Stunden-Zeitformat zu nutzen,
muss die entsprechende Einstellung überschrieben werden.


# Lösung

Zunächst muss auf dem System der Befehl `dbus-launch` verfügbar sein. Auf
Debian-basierten System (Ubuntu, Mint, PopOS, ...) muss dazu das Paket
`dbus-x11` installiert werden:
```sh
sudo apt install dbus-x11
```

Anschließend kann mit folgendem Befehl auf dem GNOME3-Desktop das Zeitformat
angepasst werden.

```
sudo dbus-launch dconf write \
    /org/gnome/desktop/interface/clock-format "\"24h\""
```

Mit dem Ändern des Wertes auf `\"12h\"` kann auf dieselbe Weise das
12-Stunden-Format angewendet werden.
