---
title: GDM time format
---

## Change gdm time format in GNOME3

Make sure that the `dubs-x11` package ist installed to execute `dbus-launch`.

```
sudo dbus-launch dconf write \
    /org/gnome/desktop/interface/clock-format "\"24h\""
```

You can also set `\"12h\"` for a 12h time format.
