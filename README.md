# nginx-info

A repository containing various pieces of information about nginx for the purposes of being stored in a centralised location, relevant to my needs.

## General Notes

- conf files are stored in /etc/nginx/sites-available/
- conf files are symlinked (`ln -s x /etc/nginx/sites-enabled/`)
- how to update nginx config: `sudo nginx -s reload`
  - You don't want to use `stop` or `quit` as those break it and require you to restart the nginx daemon.

## Make commands

```make
nginx-local:
  ln -s ./localConfig /etc/nginx/sites-enabled/DIRECTORY

nginx-prod:
  ln -s ./prodConfig /etc/nginx/sites-available/DIRECTORY

nginx-stop:
  sudo nginx -s reload
```
