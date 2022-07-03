---
title: Install Steam via Flatpak
---

The steam package doesn't always install all dependencies automatically.
To make things easier, you can install the Flatpak version of Steam.

First make sure that you setup [Flatpak](../flatpak/setup) properly on your
system.

Now you can install Steam from the FlatHub repository: 
```sh
flatpak install com.valvesoftware.Steam
```

To add a SteamLibrary form another file system you must grant the
permissions for the application:
```sh
flatpak override --user --filesystem/path/to/steam/library \
    com.valvesoftware.Steam
```

Now you've installed Steam.
On the first start, you'll get a warning with a udev rule, but this can be
ignored. Controllers working properly out of the box.


## Sources
- https://flathub.org/apps/details/com.valvesoftware.Steam


## Further reading 
- Wiki for Steam-Flatpak:
  https://github.com/flathub/com.valvesoftware.Steam/wiki

