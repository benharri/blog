---
title: 'proactive redundancy'
date: 2018-11-15T18:39:26
tags:
- 'sysadmin'
- 'tilde'
---

after the [fiasco](november-13-post-mortem.html) earlier this week, i've
been taking steps to minimize the impact if tilde.team were to go down.
it's still a large spof (single-point-of-failure), but i'm reasonably
certain that at least the irc net will remain up and functional in the
event of another outage.

<!-- more -->

the first thing that i set up was a handful of additional ircd nodes:
see [the tilde.chat wiki](https://tilde.chat/wiki/?page=servers) for a
full list. slash.tilde.chat is on my personal vps, and bsd.tilde.chat is
hosted on the bsd vps that i set up for tilde.team.

i added the ipv4 addresses for these machines, along with the ip for
yourtilde.com as A records for tilde.chat, creating a dns round-robin.
`host tilde.chat` will return all four. requesting the dns record will
return any one of them, rotating them in a semi-random fashion. this
means that when connecting to tilde.chat on 6697 for irc, you might end
up on any of `{your,team,bsd,slash}.tilde.chat`.

this creates the additional problem that visiting the [tilde.chat
site](https://tilde.chat) will end up at any of those 4 machines in much
the same way. for the moment, the site is deployed on all of the boxes,
making site setup issues hard to
[debug](https://tildegit.org/tildeverse/tilde.chat/issues/8). the
solution to this problem is to use a subdomain as the roundrobin host,
as other networks like freenode do (see `host chat.freenode.net` for the
list of servers).

i'm not sure how to make any of the other services more resilient. it's
something that i have been and will continue to research moving forward.

the other main step that i have taken to prevent the same issue from
happening again was to configure the firewall to drop outgoing requests
to the subnets as defined in [rfc
1918](https://tools.ietf.org/html/rfc1918).

i'd like to consider at least this risk to be mitigated.

thanks for reading,

~ben

**update**: the round robin host is now *irc*.tilde.chat, which resolves
the site issues that we were having, due to the duplicated deployments.

