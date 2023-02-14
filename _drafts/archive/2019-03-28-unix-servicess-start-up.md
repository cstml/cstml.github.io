---
layout: post
title: 'unix: managing start-up services'
date: 2019-03-28
updated: 2020-05-24
---

# Managing start-up services

|                                        |                                                              |
| -------------------------------------- | ------------------------------------------------------------ |
| `systemctl`                            | shows all of the packages that are managed at boot time and whatnot |
| `systemctl -at service`                | shows only the services                                      |
| `systemctl -at service -state=active`  | shows only the active ones                                   |
| `systemctl list-unit-files`            | To see the files with their status as enabled or not, you can run grep on this |
| `sudo systemctl (en)disable <service>` | To (en)disable a service                                     |
| `sudo systemctl (un)mask <service.`    | To mask/unmask a service                                     |
