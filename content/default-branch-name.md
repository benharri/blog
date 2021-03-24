---
title: 'default branch name'
date: 202101101526.29
tags:
- 'git'
- 'linux'
- 'dev'
---

changing git’s default branch name has come up recently as an easy
action we can take to update our language and remove harmful ideas from
our daily usage.

i’m concerned that this effort to change the language used is ultimately
a symbolic gesture to avoid scrutiny into actual change (notably
github’s push for this change and continued contracts with ICE).

however, it’s an easy change to make.

------------------------------------------------------------------------

let’s have a look at how to change it for new repos:

    mkdir -p ~/.config/git/template
    echo "ref: refs/head/main" > ~/.config/git/template/HEAD
    git config --global init.templateDir ~/.config/git/template

note that you can put this template dir anywhere you like.

you can also set this system-wide (not just for your user) in
/usr/share, but note that this might get overriden by package updates.

    echo "ref: refs/head/main" | sudo tee /usr/share/git-core/templates/HEAD

the next time you `git init`, you’ll be on a branch named main.

to change an existing repo, you can use the `-m` switch of `git-branch`:

    git checkout master
    git branch -m master main

push with `-u` to your remote if needed and update the default branch in
the repo settings in the hosting platform of choice.

it’s a relatively easy change, but don’t kid yourself that it makes any
real impact. go protest, [donate and sign
petitions](https://blacklivesmatter.carrd.co/), and get out there to fix
the actual problems.

## update:

as of git 2.28, there’s a new configuration option and you don’t need to
use the templateDir option:

    git config --global init.defaultBranch main

tags: [git](tag_git.html), [linux](tag_linux.html), [dev](tag_dev.html)
