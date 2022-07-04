---
title: Wiki 
subtitle: >-
    Alle Dinge, die ich weiß, die ich wusste und dich ich vielleicht noch
    wissen mag.
---

# Anwendungen, Tools und Entwicklungsumgebungen

- [Android](android/index)
- Display Manager
  - [GNOME Display Manager (GDM)](display-manager/gdm/index)
- [Flatpak](flatpak/index)
- [Linux Unified Key Setup (LUKS)](encryption/luks/index)
- [Steam](steam/index)


# [Ethical Hacking](hacking.draft/index)


# Skripte

Für einige Probleme und Aufgaben liegen bereits ausführbare Skripte vor, um
Vorgänge zu automatisieren, diese sind in einem separaten Git-Repository
organisiert.
Um die Skriptsammlung herunterzuladen, kann dieses Repository heruntergeladen
werden. Es enthält alle Dateien dieses Wikis. Im Ordner `scripts/` wird ein
Submodule geladen.

Um das Repository mit allen Abhängigkeiten vollständig zu klonen, kann
folgender Befehl ausgeführt werden:
```sh
git clone --recurse-submodules \
    https://github.com/dateiexplorer/dateiexplorer.github.io.git
```
Dieser Befehl führt die drei folgenden Schritte aus:
```sh
git clone https://github.com/dateiexplorer/dateiexplorer.github.io.git`
git submodule init
git submodule update
```
Alternativ kann auch nur die Skriptsammlung heruntergeladen werden:
```sh
git clone https://github.com/dateiexplorer/script-collection.git
```


# Sonstiges

- [Handbücher/Wichtige Dateien](manuals/index)

