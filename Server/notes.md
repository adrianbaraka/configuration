# TOC

- [NGINX](#nginx)
- [Firewall](#firewall)
- [Miscellaneous](#miscellaneous)

## NGINX

- Configuration is in `/etc/nginx`.

- To add a site create a file like `mydomain.com` in `/etc/nginx/sites-available` then create a [sym link [1]](#miscellaneous) to the file in `/etc/nginx/sites-enabled`.

- To test the configuration run:
  
  ```bash
  nginx -t
  ```

- To reload the configuration:
  
  ```bash
  nginx -s reload
  ```

- Its unit file name in systemd *also man page* is `nginx`. Ensure it is **enabled** and **running**.

- The user running *recommended is `www-data`* ensure correct permissions. ie
  
  - `read` on static files
  - `execute` on directories
  - Allow `write` **only** where necessary. 

## Firewall

- Install `ufw`.
- Run `sudo ufw app list` to see pre-configured apps. Such as *nginx*, *apache*, 
- `sudo ufw status numbered` shows the status of the firewall. 
- **BEFORE** enabling it run `sudo ufw allow "OpenSSH"`. Ensure the port is allowed!!
- `ufw enable` activates the firewall.
- If changes are made while firewall is on run `sudo ufw reload`
- To enable logging. `sudo ufw logging on [level]`. level can be *low*, *medium*, *high*, *full*. The log file is found at `/var/log/ufw.log`

// TODO 
rsyslog: UFW relies on the rsyslog service (or a similar system logging daemon) to write its logs. Ensure that rsyslog is running on your system. You can check its status with sudo systemctl status rsyslog.
Log Rotation: Log files can grow large over time. Your system should have a log rotation mechanism configured (usually through logrotate) to automatically archive and manage these files.

## SSL Certificate

- Install `sudo apt install certbot python3-certbot-nginx`

## Fail2Ban

- Package name is `fail2ban`.
- Its configuration can be found at `/etc/fail2ban`.
- Run `cp jail.conf jail.local` as the former file can be overwritten during updates. Any new configurations should be done in the `jail.local` file.
- Restart the `fail2ban` service after any change using systemctl.
- To view jails run `fail2ban-client status` add `[jail]` to view for a specific one.
- Some Important changes in the file;
  * bantime 
  * maxretry
- To enable a jail add a line in the specific section `enabled = true`
- *Only enable services that exist on the system else fail2ban may fail*
- To unban an ip run `fail2ban-client set [jail] sshd unbanip [ip-addresss] 192.168.0.100`
- Log file `/var/log/fail2ban.log `
- For easier configuration add a `*local` file in `jail.d` directory for the enabled things example;

```bash
[/etc/fail2ban/jail.d/webserver.local]

[nginx-botsearch]
enabled = true
```

## Miscellaneous

1. When creating a symlink specify the **full path** for both the source and destination else the link will be broken. eg `ln -s /etc/os-release ~/Desktop` 