---
layout: post
title:  "Changing MAC hostnames"
date:   2019-01-29 00:00:00 +0000
categories: python
tags: Python Educational WIP
---
# Search Procedure
```
hostname -f
```
# Change Procedure
[Sourece Link][https://knowledge.autodesk.com/support/smoke/learn-explore/caas/sfdcarticles/sfdcarticles/Setting-the-Mac-hostname-or-computer-name-from-the-terminal.html]

Perform the following tasks to change the workstation hostname using the scutil command.
* Open a terminal.
* Type the following command to change the primary hostname of your Mac:
* This is your fully qualified hostname, for example myMac.domain.com
```
sudo scutil --set HostName <new host name>
```
* Type the following command to change the Bonjour hostname of your Mac:
* This is the name usable on the local network, for example myMac.local.
```
sudo scutil --set LocalHostName <new host name>
```
* Optional: If you also want to change the computer name, type the following command:
* This is the user-friendly computer name you see in Finder, for example myMac.
```
sudo scutil --set ComputerName <new name>
```
* Flush the DNS cache by typing:
```
dscacheutil -flushcache
```
* Restart your Mac.

