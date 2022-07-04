---
title: Steam - Installation via Flatpak
---

# Problem

Das Steam-Paket installiert nicht immer alle Abhängigkeiten automatisch mit.
Das kann dazu führen, dass einige Spiele oder Proton nicht wie erwartet
funktionieren.
Flatpak liefert alle Abhängigkeiten mit aus, die Steam benötigt und speichert
sie in einer isolierten Sandbox.


# Lösung

Um fortzufahren, muss zunächst [Flatpak](../flatpak/index) auf dem System
installiert und eingerichtet sein.

Anschließend kann das entsprechende Paket von FlatHub heruntergeladen werden:
```sh
flatpak install com.valvesoftware.Steam
```

Soll eine SteamLibrary von einer ander Festplatte eingebunden werden, müssen
dem Flatpak hierfür zunächst entsprechende Berechtigungen gegeben werden:
```sh
flatpak override --user --filesystem/path/to/steam/library \
    com.valvesoftware.Steam
```

Das war's! Steam ist nun auf dem System installiert.

> **Hinweis:** Beim ersten Starten von Steam wird eine Warnung angezeigt, dass
> eine entsprechende udev-Regel angepasst werden soll, um eine
> Controllerunterstützung zu gewährleisten. Der XBox-Controller funktioniert
> ohne weitere Konfigurationen. Die Meldung kann in diesem Fall ignoriert
> werden.


# Quellen 

- [flathub.org](https://flathub.org/apps/details/com.valvesoftware.Steam)


# Weiterführende Links 

- [Wiki des Steam-Flatpak](https://github.com/flathub/com.valvesoftware.Steam/wiki)

