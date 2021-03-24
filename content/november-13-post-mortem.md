---
title: 'november 13 post mortem'
date: 201811132020.33
tags:
- 'post-mortem'
- 'linux'
- 'sysadmin'
---

we had something of an outage on november 13, 2018 on tilde.team.

i awoke, not suspecting anything to be amiss. as soon as i logged in to
check my email and irc mentions, it became clear.

tilde.team was at the least inaccessible, and at the worst, down
completely. according the message in my inbox, there hade been an
attempted "attack" from my IP.

------------------------------------------------------------------------

> We have indications that there was an attack from your server. Please
> take all necessary measures to avoid this in the future and to solve
> the issue.

at this point, i have no idea what could have happened over night while
i'm sleeping. the timestamp shows that it arrive only 30 minutes after
i'd turned in for the night.

when i finally log on in the morning to check mails and irc mentions, i
find that i'm unable to connect to tilde.team... strange, but ok; time
to troubleshoot. i refresh the [webmail](https://mail.tilde.team) to see
what i'm missing. it ends up failing to find the server. even stranger!
i'd better get the mails off my phone if they're on my @tilde.team mail!

here, i launch in to full debugging mode: what command was it? who ran
it?

search `~/.bash_history` per user was not very successful. nothing i
could find was related to net or map. i had checked
`sudo grep nmap /home/*/.bash_history` and many other commands.

at this point, i had connected with other ~teammates across other irc
nets ([\#!](https://hashbang.sh/), [~town](https://tilde.town), etc).
among suggestions to check `/var/log/syslog`, `/var/log/kern.log`, and
`dmesg`, i finally decided to check `ps`. `ps -ef | grep nmap` yielded
nmap on an obscured uid and gid, which is shortly established to belong
to a container i had provisioned for [~fosslinux](/~fosslinux/).

i'm not considering methods of policing access to any site over port 80
and port 443. this is crazy. how do you police `nmap` when it isn't
scanning on every port?

after a bit of shit-talking and reassurance from other sysadmins, i
reexamined and realized that [~fosslinux](/~fosslinux/) had only run
`nmap` for addresses in the `10.0.0.0/8` space. the `10/8` address space
is intended to not be addressable outside the local space. how could
[hetzner](https://hetzner.com) have found out about a localhost network
probe!?

finally, after speaking with more people than i expected to speak with
in one day, i ended up sending three different support emails to hetzner
support, which finally resulted in them unlocking the ip.

it's definitely time to research redundancy options!

tags: [post-mortem](tag_post-mortem.html), [linux](tag_linux.html),
[sysadmin](tag_sysadmin.html)
