---
title: GDM - Skalierung anpassen (HiDPI)
date: 2022-07-03
---

# Problem

Standardmäßig wird die UI von GDM bei HiDPI-Displays automatisch auf 2 (200%)
skaliert. Notebooks mit einer geringeren Auflösung (wie das Framework-Notebook)
werden ggf. auch als HiDPI-Displays erkannt. Dadurch wird die UI sehr groß.
Daher kann die Skalierung auch manuell überschrieben werden.

> **Hinweis:** Es sind nur Integerzahlen (1, 2, ...) zulässig.
> Fractionl-scaling (z.B. 1.5) wird nicht unterstützt.


# Lösung

Um die Skalierung manuell zu ändern, muss der entsprechende Wert
`scaling-factor` in den Schemata angepasst werden.

> **Hinweis:** Die Schemata liegen als XML-Dateien vor. Diese Dateien sollten
> niemals manuell editiert werden. Diese Dateien können vom Betriebssystem bei
> einem Update überschrieben werden.

> Der korrekte Weg, Konfigurationen an den Schemata vorzunehemn, ist das
> Anlegen einer `geschema.override`-Datei.
> Für weitere Informationen klicke [hier][freedesktop.org].

Kurz gesagt: Der GSettings XML-Schema-Compiler liest zuerst die XML-Dateien und
anschließend die Override-Dateien.
Es wird empfohlen, die Datein mit einem Präfix (auch Priorität genannt) von 00
bis 99 zu versehen, das die Reihenfolge angibt, in der die Datein gelesen
werden. Dabei hat 00 hat eine niedrigere Priorität und wird zuerst gelesen,
danach 01 (falls vorhanden), usw. Die Datei mit der Priorität 99 wird zuletzt
gelesen, damit überschreibt sie die Einstellungen aus vorherigen Dateien und
hat demnach die höchste Priorität. 

Wir legen also zunächst eine neue Override-Datei an. Der Name kann dabei frei
gewählt werden. Wir schreiben der Datei die höchste Priorität (99) zu, sodass
sie in jedem Fall alle anderen Einstellungen überschreibt.
```sh
touch /usr/share/glib-2.0/schemas/99_hidpi.gschema.override
```
In diese Datei können nun beliebige Einstellungen überschrieben werden. Um die
Skalierung von GDM auf 100% zu stellen, muss der `scaling-factor` auf den Wert
1 gestellt werden. Es sind nur ganzzahlige Werte erlaubt. Valide Werte sind
hier 0 (automatische Erkennung, das ist die Standardeinstellung) oder 1, 2, 3,
4 um die Skalierung entsprechend auf 100%, 200%, 300% oder 400% anzupassen.

Es kann auch die globale Skalierung von Text angepasst werden, wenn eine andere
Schriftgröße gewünscht wird. Hier sind auch Fließkommazahlen erlaubt.

Der Inhalt der Override-Datei kann folgendermaßen aussehen:
```
[org.gnome.desktop.interface]
scaling-factor=1
text-scaling-factor=1.0
```
Die Option `text-scaling-factor` ist an dieser Stelle nur optional und kann
auch enfernt oder angepasst werden.

Nachdem die Override-Dateien angelegt wurden, muss die GSettings-Datenbank
neu kompiliert werden, sodass die Einstellungen angewendet werden.
Dazu kann folgender Befehl ausgeführt werden:
```sh
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
```

# Weiterführende Links

- [freedesktop.org][freedestkop.org]

# Quelle 

- [Antwort von askubuntu.com][askubuntu.com]

[askubuntu.com]: https://askubuntu.com/a/1378987
[freedesktop.org]: https://www.freedesktop.org/software/gstreamer-sdk/data/docs/2012.5/gio/glib-compile-schemas.html
