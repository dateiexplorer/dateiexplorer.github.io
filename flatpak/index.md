---
title: Flatpak
---

# Installation

## Void Linux

Nachdem Void erfolgreich installiert wurde, kann Flatpak aus den offiziellen
Paketquellen bezogen werden:
```sh
sudo xbps-install -y flatpak
``` 

## PopOS

In PopOS ist Flatpak standardmäßig bereits vorinstalliert.
Auch FlatHub ist i.d.R. bereits als Repository hinzugefügt.


# Hinzufügen von Repositories

## Global

Um Anwendungen über Flatpak beziehen zu können, muss ein Repository hinzugefügt
werden. Eines dieser Repositories und der de facto Standard ist FlatHub:
```sh
flatpak remote-add --if-not-exsits \
    flathub https://flathub.org/repo/flathub.flatpakrepo
```
Anschließend können bspw. Anwendungen gesucht (`flatpak search`) oder
installiert (`flatpak install`) werden.

> **Hinweis:** Anwendungen werden global für alle Benutzer installiert. Es
> werden Root-Privilegien benötigt.
> Sollen Pakete für einzelne Benutzer installiert werden, kann Flatpak auch für
> jeden [Benutzer](#Benutzerspezifisch) separat konfiguriert werden.

## Benutzerspezifisch

Um Anwendungen nicht global zu installieren, sondern pro Nutzer, können die
gleichen Befehle wie für die globale Verwaltung von Flatpak-Paketen verwendet
werden mit dem zusätzlichen Flag (`--user`).

**Beispiel:**
Um Anwendungen als Benutzer installieren zu können, muss einem entsprechenden
Benutzer zunächst ein Repository hinzugefügt werden. Dazu kann man sich als
entsprechender Benutzer am System anmelden und folgenden Befehl ausführen:
```sh
flatpak --user remote-add --if-not-exsits \
    flathub https://flathub.org/repo/flathub.flatpakrepo
```
Um eine Anwendung als Flatpak, bspw. Discord für den User zu installieren, kann
entsprechend folgender Befehl ausgeführt werden:
```sh
flatpak --user install com.discordapp.Discord
```

> **Hinweis**: Bei der Installation ist das `--user`-Flag nicht zwingend
> notwendig, da ohne Root-Privilegien automatisch eine Anwendung aus den
> Benutzerspezifischen Repositories für den Benutzer zu installieren.


# Troubleshooting

## Anwendungen werden nicht im Menü angezeigt

Nachdem Flatpak konfiguiert wurde, muss eine erneute Anmeldung am System
erfolgen, um alle benötigten Variablen zu setzen.
Nach einem Ab- und erneuten Anmelden sollten die Anwendungen im Menü angezeigt
und wie eine normale Anwendung gestartet werden können.

Alternativ kann eine Anwendung auch von der Kommandozeile aus gestartet werden
via:
```sh
flatpak run <application>
```
wobei `<application>` hier durch den entsprechenden Identifier ersetzt werden
muss, für Discord bspw. `<com.discordapp.Discord>`.


## Links öffnen sich nicht 

Stelle zunächst sicher, dass ein Standardbrowser in deinem System fetgelegt
ist.

Wenn sich anschließend die Links immer noch nicht öffnen lassen, muss das
richtige `xdg`-Paket für die Kommunikation mit dem Betriebssystem installiert
sein.

GTK-Anwendungen wie Discord, benötigen das zusätzliche Paket
`xdg-desktop-portal-gtk`, QT-Anwendungen entsprechend `xdg-desktop-portal-kde`.
Diese Pakete werden in einigen Distributionen nicht standardmäßig installiert.

