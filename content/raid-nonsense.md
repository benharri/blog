---
title: 'raid nonsense'
date: 2019-01-13T13:28:45
tags:
- 'tilde'
- 'sysadmin'
---

last week i did some
[maintenance](https://tilde.team/news/025_raid_reboot) on the
tilde.team box. probably should have written about it sooner but i
didn't make time for it until now.

<!-- more -->

the gist of the problem was that the default images provided by
[hetzner](https://hetzner.com) default to raid1 between the available
disks. our box has two 240gb SSDs, which resulted in 200gb usable space
for /. it also defaulted to giving us a huge swap partition which i deem
unnecessary for a box with 64gb ram.

the only feasible solution that i've found involved using the rescue
system and the
[installimage](https://wiki.hetzner.de/index.php/Installimage/en)
software to reconfigure the disk partitions.

[deepend](https://yourtilde.com/~deepend/) recently upgraded to a
beefier dedi (more threads and more disk space) and had a bit of
contract time on the old one. he offered to let me use it as a staging
box for the meantime while i reinstalled and reconfigured my raid
settings.

i've migrated tilde.team twice before (from linode -&gt; woothosting
-&gt; hetzner -&gt; and now back to hetzner on the same box) using a
slick little rsync that i've put together.

```
rsync -auHxv --numeric-ids \
    --exclude=/etc/fstab \
    --exclude=/etc/network/* \
    --exclude=/proc/* \
    --exclude=/tmp/* \
    --exclude=/sys/* \
    --exclude=/dev/* \
    --exclude=/mnt/* \
    --exclude=/boot/* \
    --exclude=/root/* \
    root@oldbox:/* /
```

as long as the destination and source boxen are running the same
distro/version, you should be good to go after rebooting the destination
box!

the only thing to watch out for is running databases. it happened to me
this time with mysql. there were 3 pending transactions that were left
open during the rsync backup. it kept failing to start after i got the
box back up, along with all the other services that depend on it.

eventually i was able to get mysqld back up and running in recovery mode
(basically read-only) and got a mysqldump of all databases. i then
purged all existing mysql data, reinstalled mariadb-server, and restored
the mysqldump. everything came up as expected and we were good to go!

the raid is now in a raid0 config, leaving us with 468gb (not GiB)
available space. thanks for tuning in to this episode of sysadmin
adventures!

