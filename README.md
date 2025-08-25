# nginx-info

Nginx is various things.
At it's most basic, it is a web server.
It can also be a reverse proxy.
It is very customisable and has many features, some should be avoided (Eg using it for authentication, you should implement authentication by yourself).

This is a repository containing various pieces of information about nginx for the purposes of being stored in a centralised location,
since the nginx website feels cluttered.

There are a couple ways to use this repository:

1. Download [setup.sh](https://raw.githubusercontent.com/areon546/nginx-info/refs/heads/main/setup.sh).

- Give it executable status (`chmod u+x setup.sh`)
- Run it: `./setup.sh --dir=[DIRNAME]`

2. Download [nginx.zip](https://raw.githubusercontent.com/areon546/nginx-info/refs/heads/main/nginx.zip) and unzip that.

- Manually replace all instances of `DIRECTORY` with the directory of the relevant files.

3. Fork this repo, make the relevant changes to the config files in nginx/.

## General Notes

- conf files are stored in /etc/nginx/sites-available/
- conf files are symlinked (`ln -s x /etc/nginx/sites-enabled/`)
- how to update nginx config: `sudo nginx -s reload`
  - You don't want to use `stop` or `quit` as those break it and require you to restart the nginx daemon.

## Make commands

Note: You have to set the variable `WEB0=-CONF` to customise the name of the config file when copied over.

- `reload`  : updates the nginx daemon, recommended command if updated config
- `link`    : links the config file from sites-available to sites-enabled, requires `local` or `prod` to be ran beforehand
- `local`   : copies over the local config file
- `prod`    : copies over the production config file
- `stop`    : updates the nginx daemon with new config files

<!-- ## Redirects for specific Paths -->
<!---->
<!-- With nginx, you can change the configuration for specific paths on the website. -->
<!-- EG: `example.com/static/global.css` can be placed in a completely separate location on the computer from `example.com/static/assets`, or from `example.com/index.html`. -->
<!-- You don't need these to be subdirectories of one another. -->
<!---->
<!-- As there is such freedom -->
