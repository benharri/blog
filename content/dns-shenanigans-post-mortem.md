---
title: 'dns shenanigans post-mortem'
date: 2018-08-14T15:03:49
tags:
- 'linux'
- 'sysadmin'
- 'tilde'
- 'dns'
---

let's start by saying i probably should have done a bit more research
before diving head-first into this endeavor.

i've been thinking about transferring my domains off google domains for
some time now, as part of my personal goal to self host and limit my
dependence on google and other large third-party monstrosities. along
that line, i asked for registrar recommendations.
[~tomasino](https://tomasino.tilde.team) responded with
[namesilo](https://namesilo.com). i found that they had $3.99
registrations for .team and .zone domains, which is 1/10th the cost of
the $40 registration on google domains.

i started out by getting the list of domains from the google console. 2
or 3 of them had been registered within the last 60 days, so i wasn't
able to transfer those just yet. i grabbed all the domain unlock codes
and dropped them into namesilo. i failed to realize that the dns panel
on google domains would disappear as soon as it went through, but more
importantly that the nameservers would be left pointing to the old
defunct google domains ones.

i updated the nameservers as soon as i realized this error from the
namesilo panel. some of the domains propagated quickly. others, not so
much. tilde.team was still in a state of flux between the old and new
nameservers.

in a rush to get the dns problem fixed, and under recommendation from
several people on irc, i decided to switch the nameservers for
tilde.team and tilde.zone to cloudflare, leaving another layer of flux
for the dns to be stuck in...

of the five domains that i moved to cloudflare, 3 returned with a dnssec
error, claiming that i needed to remove the DS record from that zone.
d'oh!

i removed the dnssec from those affected domains, so we should be good
to go as soon as it all propagates through the fickle beast that is dns.
