---
title: 'lxd networking and additional IPs'
date: 201807261534.50
tags:
- 'linux'
- 'sysadmin'
- 'ubuntu'
---

now that tilde.team is on a fancy-shmancy new dedi server, i've tried to
get a secondary IP address assigned to a lxd container (which i plan to
use for my personal stuff). lxd shows that the secondary IP is being
picked up by that container, but i'm still seeing the host machine's IP
as the external address.

i'm not sure how i'll need to configure the network settings on the host
machine (now that we're running ubuntu 18.04 and it uses netplan for
configs and not /etc/network/interfaces). another confusing thing is
that the main config in /etc/netplan says that the network config is
handled by systemd-networkd...

at least i have through the end of the year when my current vps runs out
to get this up and running.

ping me on [irc](https://tilde.chat) or [email](mailto:ben@tilde.team)
if you have experience with this.
