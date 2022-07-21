---
title: "Matrix Sucks"
date: 2021-08-29T15:28:27-04:00
draft: false
tags:
- 'social'
- 'selfhosting'
- 'irc'
- 'chat'
---

i’ve gotten sick of explaining why matrix is bad over and over so i’m gathering my thoughts and some points here and publishing it so i can link to it.

* no moderation capabilities
* bridges don't work well and are 1-way in order to siphon users to matrix
* it's super slow
* running a server requires a supercomputer
* de-facto not federated, everyone is on matrix.org
* even when you run your own server, it phones home with all kinds of user data to vector.im


i’ll update this later with more info when i can.

    15:25 <remyabel> their reference client is slow, had an unnecessary/confusing rename and you can't delete your account
    15:25 <remyabel> you can only "deactivate" it
    15:26 <Shell> also on a technical level it's just an /awful/ protocol
    15:26 <~ben> extremely disruptive 1way bridging
    15:26 <Shell> with a huge amount of weird bugs as a result of the fact that the devs... just have no idea what they're doing
    15:26 <~ben> completely nonexistent abuse mitigation
    15:26 <Shell> and haven't for years
    15:26 <~ben> _huge_ resource hog if you want to try to run a server
    15:27 <Shell> and yes, the approach to bridging is basically to leech off everyone else, demand huge amounts of support from volunteers who never agreed to it in the first place, and give nothing back.
    15:27 <Shell> Matrix literally wouldn't have a userbase if it wasn't for IRC.
    15:28 <~ben> they only care about usercounts
    15:29 <Shell> they have, at various points, refused to employ people to work on the IRC bridges, while the bridge was horribly broken and led to security breaches and ban evasion, while simultaneously advertising them as a primary reason to use Matrix
    15:30 <Shell> and it's not really an "open project" as the words "Matrix Foundation" would have you think - the entire thing is driven almost entirely by the Matrix.org people, anyone else's input into the project is largely ignored in place of the Matrix.org roadmap.

the connection to amdocs is FUD and not worth discussing

additional links:

* https://wiki.404.city/en/XMPP_vs_Matrix
* https://hackea.org/notas/matrix.html
* https://github.com/libremonde-org/paper-research-privacy-matrix.org/tree/master/part1
* https://gitlab.com/libremonde-org/papers/research/privacy-matrix.org/-/blob/master/part2

archive.org links:

* https://web.archive.org/web/20141217141653/http://matrix.org/
* https://web.archive.org/web/20201219215828/https://en.wikipedia.org/wiki/Matrix_%28protocol%29
* https://web.archive.org/web/20201219013924/https://lists.autistici.org/message/20200323.184245.94fa2bb8.en.html
* https://web.archive.org/web/20201221141252/https://listas.sindominio.net/pipermail/hackmeeting/2017-October/039274.html
* https://web.archive.org/web/20160616114330/https://vector.im/
* https://web.archive.org/web/20201219130957/https://matrix.org/foundation/
* https://web.archive.org/web/20201219131157/https://matrix.org/blog/2019/10/10/new-vector-raises-8-5-m-to-accelerate-matrix-riot-modular
* https://web.archive.org/web/20180806141618/https://directory.fsf.org/wiki/Talk:Riot.im
* https://web.archive.org/web/20201024035930/https://directory.fsf.org/wiki?title=Electron&oldid=71699
* https://web.archive.org/web/20201025143628/https://directory.fsf.org/wiki/Free_Software_Directory:Free_software_evaluation
* https://web.archive.org/web/20201219220645/https://matrix.org/bridges/
* https://web.archive.org/web/20201219015708/https://disroot.org/en/blog/matrix-closure
* https://web.archive.org/web/20201219014545/https://gist.github.com/maxidorius/5736fd09c9194b7a6dc03b6b8d7220d0
* https://web.archive.org/web/20201219221731/https://www.matrix.org/blog/2019/09/27/privacy-improvements-in-synapse-1-4-and-riot-1-4/
* https://web.archive.org/web/20201219123116/https://gitlab.com/libremonde-org/papers/research/privacy-matrix.org/-/blob/master/part2/README.md

