# nginx-info

A repository containing various pieces of information about nginx for the purposes of being stored in a centralised location, relevant to my needs.

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
