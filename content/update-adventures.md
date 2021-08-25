---
title: "Update Adventures"
date: 2021-08-25T00:35:13-04:00
draft: false
---

here's the longer version about the outage on august 24, 2021:

after finishing the package upgrades on my proxmox hosts for the new release
(proxmox 7.0, corresponding to debian 11/bullseye), i typed reboot and pressed
enter, crossing my fingers that it would come back up as expected.

it didn't.

luckily i had done one last round of vm-level backups before starting the
upgrade! i started restoring the backups to one of my other servers, but my
authoritative dns is hosted on the same server as tilde.team, so that needed
to happen first.

i got the ns1 set up on my proxmox node at hetzner, but my ns2 secondary zones
had been hosted at ovh. time to move those to [he.net](https://dns.he.net)
to get it going again (and move away from a provider-dependent solution).

while shuffling VMs around, i ended up starting a restore of the tilde.team VM
on my infra-2 server at ovh. it's a large VM with two 300gb disks so it would take
a while.

i started working to update the dns records for tilde.team to live on ovh instead
of my soyoustart box, but shortly after, i received a mail (in my non-tilde inbox
luckily) from the ovh monitoring team that my server had been rebooted into rescue 
mode after being unpingable for this long.

i was able to log in with the temporary ssh password and update `/etc/network/interfaces`
to use the currently working MAC address that the rescue system was using.

once i figured out how to disable the netboot rescue mode in the control panel,
i hit reboot once more. we're back up and running on the upgraded server that it was on
at the start of the day!

[ejabberd](https://tilde.team/wiki/xmpp) wasn't happy with mysql for some reason
but everything else seems to have come back up now.

like usual, holler if you see anything amiss!

cheers,
~ben
