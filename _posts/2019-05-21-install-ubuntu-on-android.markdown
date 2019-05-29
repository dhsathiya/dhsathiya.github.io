---
layout: post
title: "Install Ubuntu on Android"
date: 2019-05-21 
categories: android
tags: android root terminal termux ubuntu
---
Simplest way to get Ubuntu Terminal on Android devices without root.

## Dependencies
Download [Termux][Termux PS] from Play Store.
Open Termux from your launcher.

---<br />
## What is [Termux][Termux]
Termux is a terminal emulator and Linux environment for Android, Chromebook, and Fire OS.

Termux is an Android terminal emulator and Linux environment application that works directly with no rooting or setup required. A minimal base system is installed automatically, additional packages are available using the APT package manager.

---<br />
## Install Ubuntu chroot with Termux
Type the following commands in Termux
```bash
pkg install wget proot
```
The script will make its files in the current directory. If you want to install Ubuntu-filesystem at a specific location then go to that location and call the script from its relative path.
```bash
mkdir -p ~/jails/ubuntu
cd ~/jails/ubuntu
wget https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh
bash ubuntu.sh
```
After running it you can run `start-ubuntu.sh` to switch into your ubuntu.

---<br />
>Thanks to [Neo-Oli][Neo-Oli] for making this super cool script !

[Termux PS]:https://play.google.com/store/apps/details?id=com.termux
[Termux]:https://wiki.termux.com/
[Neo-Oli]:https://github.com/Neo-Oli/

