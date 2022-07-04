---
title: Automatisches Enschlüsseln mit Keyfile 
---

> **Hinweis:** Diese Anleitung stellt eine Methode zur Automatischen
> Entschlüsselung beim Booten des Systems vor. Der Schlüssel wird dabei in
> einem unverschlüsselten Bereich der Festplatte gespeichert. Damit wird die
> Verschlüsselung aus Security-Sicht aufgehoben. Jeder hat damit Zugriff auf
> Daten, als wäre die Festplatte unverschlüsselt.

> **Hinweis:** Die in dieser Anleitung gezeigten Befehle benötigen
> Root-Berechtigungen. Stelle sicher, dass du entsprechende Berechtigungen
> besitzt (ggf. durch sudo).

# Generieren einer Schlüsseldatei 

Zunächst wird eine neue Schlüsseldatei erstellt:
```
dd if=/dev/urandom of=/root/luks.keyfile bs=1024 count=4
```
Die Datei sollte dem Root-Benutzer gehören. Die Berechtigungen und Ownership
der Datei kann mit dem folgenden Befehl eingesehen werden:
```
ls -l /root/luks.keyfile
```
Die Ownership (Besitzrechte) können folgendermaßen angepasst werden:
```
chown root:root /root/luks.keyfile
```
Die Berechtigungen sollten so gesetzt werden, dass kein anderer Benutzer den
Schlüssel lesen kann. Außerdem sollte der Schlüssel von niemandem modifiziert
werden können. Dies kann mit folgendem Befehl erreicht werden:
```
chmod 400 /root/luks.keyfile
```

# Keyfile zu LUKS hinzufügen

Jetzt können wir die Keyfile zu LUKS hinzufügen, um die entsprechende Partition
automatisch entschlüsseln zu können:
```
cryptsetup luksAddKey /dev/<device> /root/luks.keyfile
```
Dabei muss `<device>` mit dem Namen oder der UUID (`/dev/disk/by-uuid/<uuid>`)
der verschlüsselten Partition ersetzt werden. Eine Übersicht über mit LUKS
verschlüsselte Paritionen gibt die Datei `/etc/crypttab`.


# Automatisches Entschlüsseln konfigurieren 

Für diesen Schritt muss das Paket `cryptsetup-initramfs` installiert werden.
Auf Debian-basierten System kann der folgende Befehl ausgeführt werden:
```
apt install cryptsetup-initramfs
```
Jetzt kann die Datei `/etc/cryptsetup-initramfs/conf-hook` editiert und die
Zeile, die mit `KEYFILE_PATTERN=` beginnt auskommentiert und durch die folgende
Zeile ersetzt werden:
```
KEYFILE_PATTERN=/root/luks.keyfile
```
Anschließend muss in der `/etc/crypttab`-Datei die Authentifizierungsmethode
`none` mit der Keyfile `/root/luks.keyfile` ersetzt werden. Die gesamte Zeile
sieht demnach folgendermaßen aus (`<device>` und `<uuid>` sind Platzhalter und
können in jeder Konfiguration variieren):
```
<device> UUID=<uuid> /root/luks.keyfile luks
```
Anschließend muss das initramfs-Dateisystem neu gebaut werden:
```
update-initramfs -u
```


# Weiterführende Links
- http://atterer.org/linux-remove-disable-luks-encryption-password-on-disk-partition-crypttab-initrd


# Quellen 
- https://www.sindastra.de/p/1282/auto-unlock-encrypted-ubuntu

