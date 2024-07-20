# Notes

1. [Shell operations](#shell-operations)
2. [File permissions](#file-permissions)
3. [History](#history-and-commands)
4. [Package managements](#packages)
5. [Ports](#hosting-localhost-on-internet-using-serveo)
6. [SQL](#sql-operations)
7. [Cron-Scheduling](#crontab)
8. [SSH](#ssh)

## Shell Operations

- **Default Shell**: The default shell is `bash`.
- **Adding Aliases**: Add aliases in `.bashrc` or `.bash_aliases` file.
- **View Aliases**: Type `alias` to view all saved aliases.
- **Check Current Shell**: Type `echo $SHELL` to check which shell is in use.
- **Changing Default Shell**: To change the default shell of a user, modify it in `/etc/passwd` (requires root).

## File Permissions

- **Changing Permissions**: Use `chmod` command.
  - Syntax: `chmod u/g/o +/- rwx filename`
  - Permissions in files: `r` (read), `w` (write), `x` (execute).
  - Permissions in directories: 
    - `r` (able to see content)
    - `w` (able to change content)
    - `x` (able to enter into directory)
- **Numeric Representation**: 
  - `0` (no permission)
  - `1` (execute)
  - `2` (write)
  - `4` (read)
- **Examples**: 
  - `777` (read, write, execute for all)
  - `754` (read, write, execute for user; read and execute for group; read only for others)

## History and Commands

- **History Command**: Shows all commands used.
- **Run Command from History**: Use `!(number)` (e.g., `!566` to run command 566).
- **Hide Command from History**: Add a space before the command.

## Packages

- **Updating Repositories**: Run `sudo apt update` before installing packages.
- **Search Package**: Use `apt search <package>` to search if a package is in the official repository.
- **Install .deb Package**: Use `sudo dpkg -i <package path>` (e.g., `sudo dpkg -i /home/abc/Downloads/package.deb`).

## Hosting Localhost on Internet (Using Serveo)

- **SSH Command**: `ssh -R 80:localhost:<port> serveo.net`

## SQL Operations

- **Resetting SQL Auto Increment**: `DELETE FROM sqlite_sequence WHERE name='data';`

## Crontab

- **Edit Crontab**: `crontab -e` (open crontab for editing).
- **List Crontab**: `crontab -l` (list crontab entries).

## SSH

- Connect to SSH via password ssh `user@ipAddresss `  eg. `ssh abc@192.168.0.103` 

- Add a config file in  `~/.ssh` to store all servers connected for easier connection. It is in this format ;

- ```plain
  Host anyname(debianhome)
      Hostname ipAddress (192.168.0.103)
      Port port ssh (22)
      User user you want to login as (root)
  ```

- Can now login using `ssh debianhome`.

- Use `ssh-keygen` to generate an ssh key.

- Either copy the public key to the `.ssh/authorized_keys` file on the remote server or use this command ;
  
    `ssh-copy-id -i /path/to/idiw.pub key username@hostname` eg. `ssh-copy-id -i ~/.ssh/id_rsa.pub abc@192.168.0.103`

- ssh-keygen options: 
  
  - -C "Comment"
  
  - -t ed25519   *encryption type*

- ssh server configuration file location `/etc/ssh/sshd_config` , on termux this file can be located at `/data/data/com.termux/files/usr/etc/ssh`.
  
  ##### NB
  
  - *Use a passphrase for an added layer of security*
  
  - **After configuting ssh keys** *disable password authentication and if possible also disable root login for more security.*
  
  - *For termux (mobile) the default ssh port is 8022*
  
  - *To start ssh on termux sshd*
  
  - *Specify port with -p option*

## Service management

- Use *stacer* to view all running processes or htop.

### Systemctl

- *Requires super user access*

- Check a service `systemctl status <servicename>`
  
  - `Enabled/ Disabled` - *Whether the service starts on startup*

- Start, stop and restart a service `sudo systemctl start/stop/restart <servicename>` respectively.

- Enable and disable a service `sudo systemctl enable/disable <servicename>`

### Journalctl

- *Requires super user access*

- Type / to search for a specicic keyword *case sensitive*

- Common options
  
  - `-u` view for a specific unit eg `sudo journalctl -u ssh`
  
  - `-f` Follow the log in realtime as they are created eg `sudo journalctl -u ssh -f`
  
  - `--since` View logs since a certain time

### Network and Bluetooth Operations

- `NetworkManager`  manages wifi
- `bluetooth` 
- Use `connmanctl` easier managament.
  
  
