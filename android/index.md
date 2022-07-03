---
title: Setup Android
---

## Set up Android for React native development

1. Download the command-line-tools from the offical website:
   https://developer.android.com/studio/#downloads
   
3. Extract the files in the following folder: `$SDK_ROOT/cmdline-tools/latest`, 
   substitute `$SDK_ROOT` with any install location, e.g. 
   ```sh
   unzip cmdline-tools.zip -d $HOME/Android/sdk/cmdline-tools/latest
   ```
4. Download neccessary packages:
   ```sh
   sdkmanager --install "build-tools;30.0.2" "emulator" "platform-tools" \
       "platforms;android-30" "system-images;android-30;default;x86_64"
   ```
5. Configure Bash variables in `.bashrc`:
   ```sh
   export ANDROID_SDK_ROOT=$HOME/Android/sdk
   export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
   export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
   ```

That's all! You finished the basic setup.


## Set up emulator

The emulator can be started with `emulator --avd <name>` or alternativly with
`emulator @<name>`.

You must create a device. This can be achieved with the `advmanager`.

Example:
```sh
advmanager create avd \
    --name Pixel4a \
    --package 'system-images;android-30;default;x86_64'
    --device 25
```

This command creates a new emulated devices "Pixel4a" using the downloaded
Image (`package`) and the device configurations of a Pixel4a (`--device 25`). 

A list of all available device configurations can be shown with the
`advmanager list` command.

## List created devices 

To list already existing devices, use the following command:
```sh
advmanager list avd
```
