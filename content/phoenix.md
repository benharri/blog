---
title: 'phoenix'
date: 2018-02-26T11:57:10
tags:
- 'internet'
- 'dev'
---

inspired by [oodsnet](http://oods.net), (and my pull request to add
[darkmode](https://github.com/exezin/oodsnet/pull/5)), i started to
create my own tilde.team fork (now
[forum.tilde.team](https://forum.tilde.team/)).

the first step was to switch out the css to the [tilde.team
standard](https://tilde.team/css/) and update the classes for bootstrap.
once i got it going and integrated with the tilde.team linux auth
service, i asked other tildeans for input and suggestions.

[~micaiah](/~micaiah/) was interested in helping, but also wanted to
learn a new language and/or framework, so we decided to start over,
recreating the entire forum with
[elixir/phoenix](http://phoenixframework.org). we'd discussed elixir
previously, but never had a convincing use case to force us to learn it.

the project is live, with the source code on
[github](https://github.com/tilde-team/forum).

the thing that i'm most impressed with is the speed of the erlang
runtime :D

check out these response times. sub-millisecond!?!?!

![](https://bhh.sh/pub/photos/phx.png)

give it a look, and [join the tilde.team](https://tilde.team/signup) if
you want to come hang out!

