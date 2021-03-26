---
title: Why I chose Silex for this website
date: 2016-06-29
tags:
    - dev
    - blog
---
> UPDATE:
> this is a very old post that i'm importing from my old site...
> i'm including it for historical purposes
> here's the [deployed site](https://benhh.bhh.sh)
> and the [source for it](https://github.com/benharri/benhh.com)

### This is an introduction to my choice of framework in building this website.

#### Several options I considered for my website:
+ [Django](https://djangoproject.com/)
    * Django's opinionated Model model with its strong database ties seemed a bit much for a relatively static site
    * It's huge and unnecessarily complicated for a simple website
    * It would be a great learning experience in Python
+ [Vanilla PHP](https://php.net)
    * I have a lot of experience in vanilla PHP at my internship at [Northern Michigan University](http://nmu.edu) working in the Information Services department where I develop web applications for internal use.
    * I often find myself frustrated with PHP's quirkiness and wouldn't learn new material if I used this for my personal website.
+ [Silex](https://silex.sensiolabs.com)
    * This is a micro-framework built using components of the much larger [Symfony](https://symfony.com) framework.
    * I discovered Silex in [Heroku's PHP deployment guide](https://devcenter.heroku.com/articles/getting-started-with-php) where I noticed that it was small enough to not draw unneeded overhead and extensible enough for my website to grow as it needed.

I opted to go with Silex. The source code is available [here](https://github.com/benharri/benhh.com) for your perusal. 

I have gone through many iterations of this site. The first version was simply a clone of the [homepage](http://euclid.nmu.edu/~benharri/) that I have on my university's computer science department server. This wasn't a very useful homepage as many of the projects that I wanted to show in a portfolio were tied to a database on that server. 

I eventually moved towards a one-page style layout ([in this commit](https://github.com/benharri/benhh.com/commit/974e12e85a9ab872facf0f4a238337b2e2d216a3)) where the links in the navbar would scroll the page to pre-defined regions. I then ditched the old multipage layout and at this point I discovered [Grav](https://getgrav.org). After difficulties integrating Grav within my app (read more [here](/blog/grav-on-heroku)), I decided to roll my own blogging solution modeled after Grav's markdown content system. 

I included a YAML Front Matter + Markdown Parser and used that to define the metadata for a [blogpost](https://github.com/benharri/benhh.com/blob/master/app/controllers/Blog.php). 

There is still much to do (post sort order, paging, tagging, etc), but I appreciate the experience that I have gained in building this blogging system.
