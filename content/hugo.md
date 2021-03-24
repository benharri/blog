---
title: hugo blog rewrite
date: 2021-03-24T16:16:11-04:00
tags:
- blog
---

i finally got sick of some outstanding bashblog bugs and decided to rewrite my blog
with [hugo](https://gohugo.io)

<!-- more -->

## why fix something that ain't broken?

there are several [major bugs](https://tildegit.org/team/bashblog/issues) in
bashblog that i haven't had the time or interest to fix. luckily, i have my
blog source in a [git repo](https://tildegit.org/ben/tilde), so the messed-up
files are relatively easy to fix up.

my theory is that the cognitive load of dealing with those bugs has been
preventing me from writing any new posts... (among other current events).

plus i guess i just needed a project!

## the hard part

it was a bit of a struggle to get my blogposts converted over to a proper format.

bashblog maintains the tags with a plaintext link line at the bottom of the file
and keeps track of modify dates _on the filesystem_ using `date -r` and `touch -t`
to keep them up to date.

this makes it hard to work with the blog in any place other than where it's already
deployed live. additionally, parsing the tags to another format was a bit of a headache...

i ended up writing a little [script](https://tildegit.org/ben/blog/src/branch/main/fix_dates.sh)
to pull the timestamp from bashblog's generated html since i no longer had the original
file metadata.

## time to write more

i'm always tempted to play with the publishing process instead of actually writing.

we'll see how well i can avoid the temptation now!



