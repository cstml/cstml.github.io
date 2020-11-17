---
layout: post
title: 'unix: drive management'
date: 2019-03-28
updated: 2020-05-24
---
# Mounting Drives

One time mounting is done through the use of `mount`.

Mounting drives at boot is done under `etc/fstab`. It is pretty self explanatory how to do it and the manual is pretty clear on it. (have a read of `man fstab`)

To find the connected drives or devices that can be mounted `blkid` is the command you are looking for. Usually you would want to mount the drives in `/mnt` and to avoid all of the auth processes you would `chown <user>:<user>`. 

### Mounting a NAS

(Network Attached Storage)

You need to install CIFS utils pkg

`sudo apt install cifs-utils`
