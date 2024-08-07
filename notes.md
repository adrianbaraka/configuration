# Notes

1. [SSH](#ssh)
2. [Service management](#service-management)
3. [Git](#Git)

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

- Use [*stacer*](https://github.com/oguzhaninan/Stacer ) to view all running processes or [*htop*](https://github.com/htop-dev/htop).

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
- Use `connmanctl` easier managament if network manager fails.
  - `enable wifi` > `scan wifi` > `services` > `agent on` > `connect <wifi_service_identifier>` > `state`

## Git

### Local

- `git init` - Initializes a new Git repository in the current directory.

- `git add` Adds files to the staging area.

- `git commit -m "Commit message"` Commit staged changes

- `git status` Displays the state of the working directory and the staging area, showing changes that have been staged, not staged, and not tracked.

- `git branch`  
  
  - To list branches: `git branch`. 
  
  - To create a new branch: `git branch <branch-name>`
  
  - To delete a branch: `git branch -d <branch-name>`
  
  - To switch to a new branch `git switch <branch-name>`

- `git stash`Temporarily saves changes that are not ready to be committed
  
  - `git stash push -u` Include untracked files in the stash
  
  - `git stash push -m "stash message"` Include a stash message
  
  - `git stash list` List all stashes
  
  - `git stash apply` Apply changes from a stash. Append `stash@{1}`  to apply a specific stash
  
  - `git stash drop stash@{1}`Drop  a specific stash
  
  - `git stash clear`Delete all stashes 

### Remote

- `git clone <url>` Clone a repo

- `git pull` Pull changes from remote to local

- `git push` Push changes to remote

- `git fetch` Fetch info from remote without merging to local

- Using SSH and github:
  
  - Generate an [ssh key](#SSH)
  
  - Add the private key to ssh-agent eg:
    
    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```
  
  - Add the public key to Github
  
  - To test if it works:
    
    ```bash
    ssh -T git@github.com
    ```

### Miscellaneous

- *To switch to a branch that only exists in the remote first do a `git fetch` then `git switch -t origin/<branch-name>`*

- *To track files not in that directory use a symlink(shortcut) to point to that file.*

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
  
  `ln -s </path/to/actual/file> </path/to/symlink/shortcut/location>` create a symlink. use without -s to create a hard link(*same inode number*)

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

# Windows
## Battery Information 
- *Windows 7*  `powercfg -energy` Will generate the report `energy-report.html` located at `C:\Windows\system32`
- *Windows 8 and 10* `powercfg /batteryreport`  Will generate the report `battery-report.html`  located at `C:`
P