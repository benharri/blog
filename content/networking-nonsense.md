---
title: 'networking nonsense'
date: 2019-02-11T02:40:20
tags:
- 'tilde'
- 'linux'
- 'sysadmin'
---

i've recently been working on setting up [drone
ci](https://drone.tildegit.org) on the tilde.team machine. however,
there's been something strange going on with the networking on there.

<!-- more -->

starting up drone with
[docker-compose](https://tildegit.org/tildeverse/drone/src/branch/master/docker-compose.yml)
didn't seem to be working: `netstat -tulpn` showed the port binding
properly to 127.0.0.1:8888 but i was completely unable to get anything
from it (using curl the nginx proxy that was to come).

i ended up scrapping docker on the ~team box itself and moving it into a
lxd container (pronounced "lex-dee") with nesting enabled.

this got us in to another problem that had been seen before when using
nginx to proxy to apps running in other containers. requests were
dropped intermittently, sometimes hanging for upwards of 30 seconds.

getting frustrated with this error, i tried to reproduce it on another
host. both the docker-proxy and nginx-&gt;lxd proxies work on the first
try yielded no clues as to where things were going wrong.

in a half-awake stupor last saturday evening, i decided to try rule out
ipv6 by disabling it system-wide. as is expected for sleepy work, it
didn't fix the problem and created more in the process.

feeling satisfied that the problem didn't lie with ipv6, i re-enabled
it, only to find that i was unable to bind nginx to my allocated /64. i
may or may not have ranted a bit about this on irc but i was able to get
it back up and running by restarting systemd-networkd.

one step forwards broke something and now we're back to where we started
with the original problem of the intermittent hangups to the lxd
container.

seeing my troubles on irc, [jchelpau](https://tilde.team/~jchelpau/)
offered to help dig in to the problem with a a fresh set of eyes. he
noted right away that pings over ipv6 to the containers worked fine, but
ipv4 did not.

we ended up looking at the firewall configurations, only to find that
one of the subnets i blocked after november's [nmap
incident](november-13-post-mortem.html) included lxdbr0's subnet (the
bridge device used by lxd).

now that i made the exeption for lxdbr0, everything is working as
expected!

thanks to [fosslinux](https://tilde.team/~fosslinux/) and
[jchelpau](https://tilde.team/~jchelpau/) for their debugging help!
