---
title: Auto-unlock at boot
---

## Generating the key

First we'll generate a key:
```
dd if=/dev/urandom of=/root/luks.keyfile bs=1024 count=4
```
The key should be owned by the root user. You can check the permissons with the
following command:
```
ls -l /root/luks.keyfile
```
Set the ownership with the following command:
```
chown root:root /root/luks.keyfile
```
Set the permissons so that other users can't see the encryption key:
```
chmod 400 /root/luks.keyfile
```

## Adding the key to LUKS

Now we'll add the key to LUKS so that it can actually unlock the partition.
```
cryptsetup luksAddKey /dev/<device> /root/luks.keyfile
```
Replace `<device>` with the device name or uuid (`/dev/disk/by-uuid/<uuid>`)
of the encrypted partition. You can see the encrypted partitions in the
`/etc/crypttab` file.


## Setting up auto-unlock

You'll need `cryptsetup-initramfs` installed on your system:
```
apt install cryptsetup-initramfs
```
Now edit `/etc/cryptsetup-initramfs/conf-hook` and uncommend the following
line and replace it with:
```
KEYFILE_PATTERN=/root/luks.keyfile
```
Now replace the entry in the `/etc/crypttab` file and replace `none` with the
keyfile:
```
<device> UUID=<uuid> /root/luks.keyfile luks
```
Finally, recreate the iniframfs with:
```
update-initramfs -u
```

## Sources 
- https://www.sindastra.de/p/1282/auto-unlock-encrypted-ubuntu


## Further reading 
- http://atterer.org/linux-remove-disable-luks-encryption-password-on-disk-partition-crypttab-initrd


