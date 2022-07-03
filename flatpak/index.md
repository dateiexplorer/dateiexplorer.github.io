---
title: Flatpak
---

## Void linux

After Void is successfully installed, you can install Flatpak from the official
void-packages:
```sh
sudo xbps-install -y flatpak
```
After that you must ad a Flatpak repository to get applications. One of those
repositories is FlatHub.
```sh
flatpak remote-add --if-not-exists \
    flathub https://flathub.org/repo/flathub.flatpakrepo
```
Afterwards you can search and install any application you want.


## Troubleshooting

### Applications not shown up in the menu

After you set up Flatpak you must relogin to set up all neccessary variables.
Afterwards all applications should show up in the menus.

Otherwise you can run applications from the command line with the following
command:
```
flatpak run <identifier>
```


### Links doesn't open my browser 

Make sure that you've set a default browser in your environment.
If the links doesn't open, you'll need to install the right `xdg` package.
For GTK applications such as Discord, you'll need to install the
`xdg-destop-portal-gtk` package, for QT applications you'll need the
`xdg-desktop-portal-kde` package.
Those packages aren't always installed automatically based on the distribution.
