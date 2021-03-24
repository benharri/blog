---
title: 'dotfiles'
date: 2018-07-22T19:26:26
tags:
- 'linux'
- 'dotfiles'
- 'git'
---

finally got around to updating my
[dotfiles](https://git.tilde.team/ben/dotfiles) to use gnu stow. i
adapted [~tomasino's
makefile](https://github.com/jamestomasino/dotfiles/blob/master/Makefile)
for use with the configs that i'm keeping with it.

now i just need to figure out why my ssh config doesn't copy/symlink my
config to ~/.ssh when it already exists.
