---
title: "git diff-highlight"
date: 2022-07-20T22:23:10-04:00
draft: false
tags:
- 'git'
- 'linux'
---

diff output from git can be hard to read. luckily there's a nice tool bundled with git that can help us out.

enter [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight), a little perl script found in git's contrib directory.

from its own documentation:

> [diff-highlight] post-processes the line-oriented diff, finds pairs of lines, and highlights the differening segments.

diff-highlight is shipped in a default git install but it needs to be added to your $PATH. here's how to do it on debian:

	$ sudo make -C /usr/share/doc/git/contrib/diff-highlight
	$ sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/

now you can pipe git's diff output to to diff-highlight to get a better view of what actually changed.

	git diff | diff-highlight

optionally, you can configure git to use it all the time. add the following to your `~/.gitconfig`:

	[pager]
	log = diff-highlight | less
	show = diff-highlight | less
	diff = diff-highlight | less

see the [documentation](https://github.com/git/git/blob/master/contrib/diff-highlight/README) for more usage tips!

