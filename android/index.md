---
title: Android-Entwicklungsumgebung einrichten
---

# Einrichten einer React-Native-Entwicklungsumgebung 

1. Lade die `command-line-tools` auf der
   [offiziellen Website](https://developer.android.com/studio/#downloads)
   herunter.
      
2. Extrahiere die Dateien unter folgenden Pfad:
   `$SDK_ROOT/cmdline-tools/latest`, 
   wobei `$SDK_ROOT` ein beliebiges Installationsziel darstellt.
   
   Beispiel:
   ```sh
   unzip cmdline-tools.zip -d $HOME/Android/sdk/cmdline-tools/latest
   ```

3. Installation benötigter Pakete:
   ```sh
   sdkmanager --install "build-tools;30.0.2" "emulator" "platform-tools" \
       "platforms;android-30" "system-images;android-30;default;x86_64"
   ```
   
   > **Hinweis:** React-Native empfiehlt diese Pakete für die Entwicklung.
   > Um die aktuelle empfohlenen Version einzusehen, kann die entsprechende
   > [React-Native-Website](https://reactnative.dev/docs/environment-setup)
   > eingesehen werden.
   
   
4. Konfiguration von Bash-Variablen in `.bashrc`:
   ```sh
   export ANDROID_SDK_ROOT=$HOME/Android/sdk
   export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
   export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
   ```

Das war's! Alle benötigten Komponenten wurden installiert.


# Erstellen eines Emulator-Devices 

Der Emulator eines Android-Devices cann mithilfe folgendes Befehls gestartet
werden:
```sh
emulator --avd <name>
```
Alternativ kann auch dieser Befehl verwendet werden können:
```sh
emulator @<name>
```

Zuvor muss ein entsprechendes Devices angelegt werden. Dies kann mit CLI-Tool
`advmanager` gemacht werden.

Beispiel:
```sh
advmanager create avd \
    --name Pixel4a \
    --package 'system-images;android-30;default;x86_64'
    --device 25
```

Dieser Befehl erstellt ein neues Devices mit dem Name "Pixel4a" (`--name`),
einem entsprechenden Image (`--package`) und den Eigenschaften 
This command creates a new emulated devices "Pixel4a" using the downloaded
Image (`package`) and the device configurations of a Pixel4a (`--device 25`). 

Eine Liste aller verfügbaren Device-Konfigurationen kann mit dem folgenden
Befehl angezeigt werden:
```sh
advmanager list
```


# Alle erstellten Devices anzeigen

Um alle bereits erstellten Devices anzuzeigen, kann der folgende Befehl
ausgeführt werden:
````sh
advmanager list avd
```
