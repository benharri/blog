---
title: 'mastodon postgres upgrade fun'
date: 202010281631.39
tags:
- 'sysadmin'
- 'tilde'
- 'social-networks'
---

howdy friends!

if you’re a mastodon user on [tilde.zone](https://tilde.zone) (the
tildeverse mastodon instance), you might’ve noticed some downtime
recently.

here’s a quick recap of what went down during the upgrade process.

------------------------------------------------------------------------

we run the current stable version of postgresql from the [postgres apt
repos](https://wiki.postgresql.org/wiki/Apt). postgres
[13](https://www.postgresql.org/docs/release/13.0/) was released
recently and the apt upgrades automatically created a new cluster
running 13.

the database for mastodon has gotten quite large (about 16gb) which
complicates this upgrade a bit. this was my inital plan:

-   drop the 13 cluster created by the apt package upgrades
-   upgrade the 12-main cluster to 13
-   drop the 12 cluster

these steps appeared to work fine, but closer inspection afterwards led
me to discover that the new cluster had ended up with `SQL_ASCII`
encoding somehow. this is not a situation we want to be in. time to fix
it.

here’s the new plan:

-   stop mastodon
    ` for i in streaming sidekiq web; do systemctl stop mastodon-$i; done`

-   dump current database state ` pg_dump mastodon_production > db.dump`

-   drop and recreate cluster with utf8 encoding
    ` pg_dropcluster 13 main --stop pg_createcluster --locale=en_US.UTF8 13 main --start`

-   restore backup
    ` sudo -u postgres psql -c "create user mastodon createdb;" sudo -u mastodon createdb -E utf8 mastodon_production sudo -u mastodon psql < db.dump`

i’m still not 100% sure how the encoding reverted to ascii but it seems
that the locale was not correctly set while running the apt upgrades…

if this happens to you, hopefully this helps you wade out while keeping
all your data :)
