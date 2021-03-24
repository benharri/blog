---
title: 'git remotes with ssh aliases'
date: 201801121330.26
tags:
- 'git'
- 'ssh'
---

did you know that `~/.ssh/config` aliases work for git remotes??

~/.ssh/config

    Host gh
    HostName github.com
    User git
    IdentityFile ~/.ssh/gh_key

you can now use `gh:username/repo` as the remote in place of
`git@github.com:username/repo`, which is much shorter and easier to type
many times!

`git clone gh:benharri/learngit`

there are many other use cases for the `ssh_config` file. for example,
here is my config for the tilde machine for easy ssh connections.

    Host tilde
    HostName tilde.team
    User ben

then use `ssh tilde` to start a new ssh session. this also works with
`scp`: try something like this `scp file.txt tilde:workspace/.` in place
of `scp file.txt ben@tilde.team:workspace/.`

the ssh\_config file is super useful. check `man ssh_config` for a full
list of options!

tags: [git](tag_git.html), [ssh](tag_ssh.html)
