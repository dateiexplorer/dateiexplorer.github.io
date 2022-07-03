---
title: Sea of Thieves
---

## Troubleshooting

### Spiel startet nicht

Unter Void tritt beim Starten folgender Fehler in den Proton-Logs (PROTON=1)
auf:
```
eventfd: Too many open files.
```

Um dieses Problem zu beheben, muss die maximale Anzahl geöffneter Dateien
erhöht werden. Dafür muss die Datei `/etc/security/limits.conf` editiert
werden.

Füge der Datei folgende Zeile hinzu:
```
* hard nofile 1000000
```

Das setzt für alle Benutzer (`*`) die maximale Anzahl geöffneter Dateien auf
`1000000`. Dadurch wird das Problem behoben und das Spiel lässt sich starten.

#### Quellen
- https://www.protondb.com/app/1172620/
- https://askubuntu.com/questions/1182021/too-many-open-files/1182049#1182049
