---
title: Heroku with Grav flat-file CMS
date: 2016-06-25
tags:
    - dev
    - blog
---
> NOTE:
> this is a historical post that i'm importing from my old site.

When I started building a website (sparked by the purchase of my first personal domain name), I started looking into many different solutions to my web development process. 

I had already decided that I would use a free dyno on [Heroku](https://heroku.com) for hosting.

As I researched additional solutions, I came upon the world of the PHP CMS (Content Management System, for the uninitiated). Just the sheer number and variety of CMS is [terrifying](https://en.wikipedia.org/wiki/List_of_content_management_systems#PHP). 

The free tier for databases in Heroku felt lacking in peace of mind and ease of setup so I focused my search to the realm of the "flat-file" CMS.

I discovered [Grav](https://getgrav.org) purely by chance. Grav claims to be fast and extensible. I was enticed by the flashy admin interface replete with responsive UI and a gorgeous built-in Markdown editor for content creation.

After a bit of [configuration](https://learn.getgrav.org/hosting/paas/heroku), I managed to deploy a Grav instance into a Heroku dyno (a rather annoying affair which involved deploying caches to Heroku and `mod_rewrite` rules in `.htaccess`).

The tricky part came when I brought the [Admin Plugin](https://github.com/getgrav/grav-plugin-admin) into the picture. Without the Admin Plugin, you need to directly change the configurations and add content from the filesystem and then deploy that to the web. You are able, however, to use PHP's built-in development webserver (`php -S localhost:9000`) to test your changes. 

Once I got the Admin plugin working (don't forget to clear your cache if you're deploying to Heroku -- or make sure that the cache directory is in your `.gitignore` file), I started making changes to my `.yml` configuration files and writing some content with the built-in Markdown editor. I was very impressed with the Admin interface. It's very modern-feeling, while still being lightning-quick. 

Then I needed to make a change that wasn't available from the Admin interface... After the next deploy to Heroku, every change that I had made from within the Admin interface was obliterated. This is the main flaw in hosting a Grav app on Heroku. The ephemeral file system for a dyno on Heroku works just fine, but when the dyno restarts, it is regenerated to the state at the latest build. It's important to note that dynos go down any time you push a new build and at [least once a day](https://devcenter.heroku.com/articles/dynos#restarting). 
> Dynos restart when:
+ create a new release by deploying new code
+ change your config vars
+ change your add-ons
+ run heroku restart

I then read more about the [ephemeral filesystem](https://devcenter.heroku.com/articles/dynos#ephemeral-filesystem) of Heroku dynos.

> Each dyno gets its own ephemeral filesystem, with a fresh copy of the most recently deployed code. During the dyno’s lifetime its running processes can use the filesystem as a temporary scratchpad, but no files that are written are visible to processes in any other dyno and any files written will be discarded the moment the dyno is stopped or restarted. For example, this occurs any time a dyno is replaced due to application deployment and approximately once a day as part of normal dyno management.

This is a useless setup for a Grav application where everything is a file. This may sound a bit harsh, but changes to the live app will be destroyed within a day. This just means that there are two options:
1. Ditch the Admin plugin
2. Use a full LAMP stack locally to make changes to the files from within the Admin interface before deploying to Heroku

I chose to ditch the Admin plugin. Making changes to the project from within the filesystem in [my text editor](https://sublimetext.com/3) was totally acceptable.

Not long after trying to integrate a Grav app within the Silex application that is my website (rather than linking to the Grav app through a subdomain of benhh.com), I gave up Grav for my blog entirely and decided to roll my own [blogging solution](/blog/silex).

