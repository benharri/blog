---
title: sqlite3 for wordpress
date: 2022-07-06T13:53:00
draft: false
tags:
- 'blog'
- 'wordpress'
- 'sysadmin'
---

sqlite3 for wordpress
=====================

running wordpress with sqlite is quick, easy, and can be much less
system administration load as it eliminates the need for a separate
database process running.

[this site](https://wptest.bhh.sh) is currently running with sqlite using [aaemnnosttv's
drop-in](https://github.com/aaemnnosttv/wp-sqlite-db).

set it up
---------

-   download <https://wordpress.org/latest.tar.gz>
-   extract it into your webroot (something like `/var/www`)
-   download
    [db.php](https://github.com/aaemnnosttv/wp-sqlite-db/raw/master/src/db.php)
    and add it to `/var/www/yoursite/wp-content/`
-   follow the normal setup instructions but skip the database fields
-   profit????

nginx config
------------

adjust configs as needed. this is the live config for this site
wptest.bhh.sh.

snippets/ssl/bhh.sh just includes the block from certbot that points to
the right cert and key.

    server {
            listen 80;
            server_name wptest.bhh.sh;
            return 307 https://$server_name$request_uri;
    }

    server {
            listen 443 ssl;
            server_name wptest.bhh.sh;
            include snippets/ssl/bhh.sh;
            index index.php index.html;
            root /var/www/wptest.bhh.sh;
            client_max_body_size 100M;

            location / {
                    try_files $uri $uri/ /index.php?$args;
            }

            location = /favicon.ico {
                    log_not_found off;
                    access_log off;
            }

            location = /robots.txt {
                    allow all;
                    log_not_found off;
                    access_log off;
            }

            location ~* wp-config.php {
                    deny all;
            }

            location ~ \.php$ {
                    include snippets/fastcgi-php.conf;
                    fastcgi_intercept_errors on;
                    fastcgi_pass unix:/run/php/php7.4-fpm.sock;
            }

            location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
                    expires max;
                    log_not_found off;
            }

            location ~ /\.ht {
                    deny all;
            }
    }
