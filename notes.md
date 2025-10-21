# Notes

1. [Linux OS](#linux-os)
   - [Service Management](#service-management)
   - [File Management](#file-management)
   - [Packages](#packages)
   - [Shell Operations](#shell-operations)
   - [Crontab](#crontab)
   - [User and Group Management](#user-and-group-management)
     - [Users](#users)
     - [Password Management](#password-management)
     - [Groups](#groups) 
2. [Windows OS](#windows-os)
   - [Battery Info](#battery-information)
3. [SSH](#ssh)
4. [Git](#git)
5. [Disk Management](#disk-management)
6. [Miscellaneous](#miscellaneous)
   - [SQL](#sql-operations)
   - [Port forwading](#port-forwading-serveo)

## Linux OS

- Use man pages for more detailed info.

- All Man pages are stored in `/usr/share/man`
  
  - `/usr/share/man/man1/` contains man pages for user commands (section 1).
  
  - `/usr/share/man/man2/` contains man pages for system calls (section 2).
  
  - `/usr/share/man/man3/` contains man pages for library functions (section 3).
  
  - `/usr/share/man/man4/` contains man pages for **Special Files** (section 4).
  
  - `/usr/share/man/man5/` contains man pages for **File Formats and Conventions** (section 5).
  
  - `/usr/share/man/man6/` contains man pages for **Games and Screensavers** (section 6).
  
  - `/usr/share/man/man7/` contains man pages for **Miscellaneous** (section 7).
  
  - `/usr/share/man/man8/` contains man pages for **System Administration Commands** (section 8).

- Use `grep` to search for a specific one.

- For built in shell commands use help eg `help read`
  
  - `help` lists all built in commands.

### Service management

- Use [_stacer_](https://github.com/oguzhaninan/Stacer) to view all running processes or [_htop_](https://github.com/htop-dev/htop).
- Default unit files are found in`/lib/systemd/system/`. *`grep` for .service files.*
- Another location is `/etc/systemd/system`

#### Systemctl

- _Requires super user access_

- Check a service `systemctl status <servicename>`
  
  - `Enabled/ Disabled` - _Whether the service starts on startup_

- Start, stop and restart a service `sudo systemctl start/stop/restart <servicename>` respectively.

- Enable and disable a service `sudo systemctl enable/disable <servicename>`

#### Journalctl

- _Requires super user access_

- Users in groups 'adm', 'systemd-journal' can see all messages.

- Common options
  
  - `-u` view for a specific unit eg `sudo journalctl -u ssh`
  
  - `-f` Follow the log in realtime as they are created eg `sudo journalctl -u ssh -f`
  
  - `--since` View logs since a certain time

#### Network and Bluetooth Operations

- `NetworkManager` manages wifi
- `bluetooth`
- Use `connmanctl` easier managament if network manager fails.
  - `enable wifi` > `scan wifi` > `services` > `agent on` > `connect <wifi_service_identifier>` > `state`

### File Management

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
  
  `ln -s </path/to/actual/file> </path/to/symlink/shortcut/location>` create a symlink. use without -s to create a hard link(_same inode number_)

### Packages

- **Updating Repositories**: Run `sudo apt update` before installing packages.
- **Search Package**: Use `apt search <package>` to search if a package is in the official repository.
- **Install .deb Package**: Use `sudo dpkg -i <package path>` (e.g., `sudo dpkg -i /home/abc/Downloads/package.deb`).  A better one is use
- `sudo apt install <package>`
- Add `purge` to remove configuration files while uninstalling or after
- `dpkg -l` list all installed packages.
- `sudo xargs -a file.txt apt install -y` to install all files from a txt file

### Shell Operations

- **Default Shell**: The default shell is `bash`.

- **Adding Aliases**: Add aliases in `.bashrc` or `.bash_aliases` file.

- **View Aliases**: Type `alias` to view all saved aliases.

- **Check Current Shell**: Type `echo $SHELL` to check which shell is in use.

- **Changing Default Shell**: To change the default shell of a user, modify it in `/etc/passwd` (requires root).
  
  ***

- **History Command**: Shows all commands used.

- **Run Command from History**: Use `!(number)` (e.g., `!566` to run command 566).

- **Hide Command from History**: Add a space before the command.
  
  ***

- Use [this prompt generator](https://bash-prompt-generator.org/) to generate a custom PS1 prompt.
  
  ---

- stdin 0 stdout 1 stderr 2. Redirect each to separate places with > or append with >>.

- /dev/null is basically a black hole of files.

---

- To unhide files from whisker navigate to `~/.local/share/applications/` or `/usr/share/applications/` open the .desktop file and change `HIDDEN` to `false`.

- `xdg-open .` Opens the file manager in the cwd.

---

- `man test` Is the man page for tests commonly used in if statements eg `
  
  ```bash
     -d FILE
            FILE exists and is a directory`
  ```

- a

---

- Settings > Window Manager > Keyboard, scroll down to Tile Window section More keyboard shortcuts

---

- Some `notify-send` icons for `-i` are 
  
  - dialog-information, help, info
  
  - dialog-warning, dialog-error, error
  
  - preferences-desktop, system-run, utilities-terminal, network-workgroup

- The icons are located in `usr/share/icons`or `~/.icons` in the selected icons folder.

- Can search by example:
  
  - `find /usr/share/icons/ -name '*airplane*'`

- [Zenity](https://help.gnome.org/users/zenity/stable/) Can also be used to display info or get all sorts of info from the user using a GUI.

---

- Add 1920 * 1080 resolution to second monitor

- `xrandr`  Identify the second display name

- `cvt 1920 1080` New mode

- `xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync` - Modeline

- `xrandr --addmode <display_name> "1920x1080_60.00"` `Associate with display 

- `xrandr --output <display_name> --mode "1920x1080_60.00"` Apply 

---

- `sudo dmesg -w` learn more on this... keyboard mapping

---

- To disable audio beep append `blacklist pcspkr` to the file `/etc/modprobe.d/blacklist.conf` then reboot the system

---

- Ensuring NetworkManager handles wifi connections: 
  
  - Disable wicd
    
    ```bash
    sudo systemctl stop wicd
    sudo systemctl disable wicd
    ```
  
  - Disable ifupdown edit the file `/etc/network/interfaces`. Comment out any lines related to your Wi-Fi interface (likely labeled as `wlan0` or `wlp3s0`) eg
    
    ```bash
    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).
    
    source /etc/network/interfaces.d/*
    
    # The loopback network interface
    auto lo
    iface lo inet loopback
    
    # The primary network interface
    allow-hotplug wlp2s0
    #iface wlp2s0 inet dhcp
    #    wpa-ssid ABC
    #    wpa-psk  c
    ```

- Restart networkManager after `sudo systemctl restart NetworkManager`

---

- To set grub as first in the boot order run `sudo grub-install` then `sudo update-grub`

---

- Use `pkexec` to ask for authentication using a GUI.
  
  ```bash
  pkexec nano /etc/hosts
  ```

---

- [Cairo Dock](https://packages.debian.org/trixie/cairo-dock) to remove weird rectangle go to window manager tweaks > compositor > disable show shadows under docks

### Crontab

- **Edit Crontab**: `crontab -e` (open crontab for editing).

- **List Crontab**: `crontab -l` (list crontab entries).

- To generate a crontab entry use [this crontab generator](https://crontab-generator.org/).

### User and Group management

- **/etc/passwd**: Contains user account information, including username, UID, GID, home directory, and shell.

- **/etc/shadow**: Contains encrypted passwords and password aging information.
  
  - **Example Entry**: `john:$6$abc123$...:18023:0:99999:7:::`
    - `john`: Username.
    - `$6$abc123$...`: Encrypted password.
    - `18023`: Last password change (in days since Jan 1, 1970).
    - `0`: Minimum number of days between changes.
    - `99999`: Maximum number of days between changes.
    - `7`: Days before expiration to warn the user.

- **/etc/group**: Contains group information, including group name, GID, and members.

#### Users

**Creating Users**

- **Command**: `adduser`
  
  - **Syntax**: `adduser [options] username`
  - **Common Options**:
    - `--home DIR`: Specify a custom home directory for the user.
    - `--shell SHELL`: Specify the user's shell (e.g., `/bin/bash`).
    - `--uid UID`: Specify the UID for the user.
    - `--ingroup GROUP`: Add the user to a specific initial group.
    - `--gecos GECOS`: Set GECOS fields (full name, room number, work phone, home phone).
    - `--disabled-password`: Create a user without setting a password (useful for system users).
    - `--expiredate EXPIRE_DATE`: Set an expiration date for the user account.

- **Example**: `sudo adduser --shell /bin/bash john`

- **Deleting Users**
  
  - **Command**: `deluser`
    
    - **Syntax**: `deluser [options] username`
    - **Common Options**:
      - `--remove-home`: Remove the user's home directory and mail spool.
      - `--remove-all-files`: Remove all files owned by the user on the system.
      - `--backup`: Create a backup of all files before deleting them.
      - `--force`: Force removal even if the user is logged in.
  
  - **Example**: `sudo deluser --remove-home john`

#### Password Management

- **Setting a Password**: `passwd`
  
  - **Syntax**: `passwd username`
  - Prompts the user to enter and confirm a new password.

- **Example**: `sudo passwd john`

- **Password Aging**: Controls how often a user must change their password.
  
  - **Command**: `chage`
  - **Syntax**: `chage [options] username`
  - **Common Options**:
    - `-m`: Minimum number of days between password changes.
    - `-M`: Maximum number of days a password is valid.
    - `-W`: Number of days before expiration that a user is warned.
    - `-E`: Account expiration date.

- **Example**: `sudo chage -M 90 john`

#### Groups

- Use `groups [username]` to view groups a user is in

- To add a user to a group use `usermod -aG` eg
  
  - `sudo usermod -aG developers john`

- **Removing a User from a Group**
  
  **Method 1: Using the `gpasswd` Command**
  
  - **Command**: `gpasswd -d username groupname` eg:
    
    - `sudo gpasswd -d john developers`
      
      - This removes `john` from the `developers` group
  
  **Method 2: Using the `usermod` Command**
  
  - **Command**: `usermod -G group1,group2,... username`
    - This method requires specifying all groups the user should remain in. It will remove the user from any groups not listed. eg
      - `sudo usermod -G sudo john`

- **Creating Groups**
  
  - **Command**: `groupadd`
    
    - **Syntax**: `groupadd [options] groupname`
    - **Common Options**:
      - `-g`: Specify the GID (Group ID) for the group.
  
  - **Example**: `sudo groupadd developers`

- **Modifying Groups**
  
  - **Command**: `groupmod`
    
    - **Syntax**: `groupmod [options] groupname`
    - **Common Options**:
      - `-n`: Change the group name.
      - `-g`: Change the GID of the group.
  
  - **Example**: `sudo groupmod -n devs developers`

- **Deleting Groups**

- **Command**: `groupdel`
  
  - **Syntax**: `groupdel groupname`

- **Example**: `sudo groupdel devs`

##### Special groups

1. **`wheel`**: Members can execute any command with root privileges using `sudo`.(redHat)
2. **`sudo`**: Members can execute commands as root using `sudo`.
3. **`adm`**: Members can read system logs without needing `sudo`.
4. **`systemd-journal`**: Members can view logs managed by `systemd-journald` using `journalctl`.
5. **`systemd-network`**: Members can configure network interfaces and view network status.
6. **`dialout`**: Members can use serial devices without `sudo`.
7. **`audio`**: Members can access and use audio devices like speakers and microphones.
8. **`video`**: Members can use video hardware, such as webcams and GPUs.
9. **`lp`**: Members can manage printers and print jobs.
10. **`plugdev`**: Members can mount and use removable storage devices.
11. **`docker`**: Members can manage Docker containers, images, and networks without needing `sudo`.
12. **`www-data`**: Members can read and write to web server directories, often used for web development.
13. **`games`**: Members can read and write to game directories, useful for saving game progress or installing mods.

## Windows OS

### Battery Information

- _Windows 7_ `powercfg -energy` Will generate the report `energy-report.html` located at `C:\Windows\system32`
- _Windows 8 and 10_ `powercfg /batteryreport` Will generate the report `battery-report.html` located at `C:`

## SSH

- Connect to SSH via password ssh `user@ipAddresss ` eg. `ssh abc@192.168.0.103`

- Add a config file in `~/.ssh` to store all servers connected for easier connection. It is in this format ;

- ```plain
  Host anyname(debianhome)
      Hostname ipAddress (192.168.0.103)
      Port port ssh (22)
      User user you want to login as (root)
      IdentityFile ~/.ssh/debian_id_ed25519
  ```

- Can now login using `ssh debianhome`.

- Use `ssh-keygen` to generate an ssh key.

- Either copy the public key to the `.ssh/authorized_keys` file on the remote server or use this command ;
  
  `ssh-copy-id -i /path/to/idiw.pub key username@hostname` eg. `ssh-copy-id -i ~/.ssh/id_rsa.pub abc@192.168.0.103`

- ssh-keygen options:
  
  - -C "Comment"
  
  - -t ed25519 _encryption type

- If a custom name was used for the key must specify the location of the key using the -i option like so. `ssh -i ~/.ssh/debian_id_ed25519 user@server-ip` or in the `~/.ssh/config` file  as `IdentityFile`

- ssh server configuration file location `/etc/ssh/sshd_config` , on termux this file can be located at `/data/data/com.termux/files/usr/etc/ssh`.
  
  ##### NB
  
  - _Use a passphrase for an added layer of security_
  
  - **After configuring ssh keys** _disable password authentication and if possible also disable root login for more security._
  
  - _For termux (mobile) the default ssh port is 8022_
  
  - _To start ssh on termux sshd_
  
  - _Specify port with -p option_

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
  
  - `git stash apply` Apply changes from a stash. Append `stash@{1}` to apply a specific stash
  
  - `git stash drop stash@{1}`Drop a specific stash
  
  - `git stash clear`Delete all stashes

### Remote

- `git clone <url>` Clone a repo

- `git pull` Pull changes from remote to local

- `git push` Push changes to remote

- `git fetch` Fetch info from remote without merging to local

- To delete a branch in the remote `git push origin --delete <branch-name>`

- Using SSH and github:
  
  - Generate an [ssh key](#ssh)
  
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
  
  - If the repo was cloned using HTTPs it will continue authentication using that. To   view how it is authenticated use `git remote -v` .
  
  - To change to SSH use `git remote set-url origin git@github.com:username/repo-name.git` 
  
  - To HTTPs use `git remote set-url origin https://github.com/<your-username>/<your-repo-name>.git`

### Miscellaneous-git

- _To switch to a branch that only exists in the remote first do a `git fetch` then `git switch -t origin/<branch-name>`_

- _To track files not in that directory use a symlink(shortcut) to point to that file._

## Disk Management

- Use [disk drill](https://mega.nz/file/eZVWxKwS#e0A6pGnHLqJAh9SlSbH2qkYjr3SRxMNht3gSb_aHMsU) to recover files and basically manage the drives.

### Windows

- Use `diskpart` to execute commands and `disk management` to visualize the effects.

- **Listing Disks and Partitions:**
  
  - **List Disks:** `list disk`
  - **List Volumes:** `list volume`
  - **List Partitions:** After selecting a disk, use `list partition`.

- **Selecting a Disk, Volume, or Partition:**
  
  - **Select Disk:** `select disk [number]`
  - **Select Volume:** `select volume [number]`
  - **Select Partition:** `select partition [number]`

- Partitions
  
  - Create a partition `create partition primary size=[number in MB]`
  
  - Delete a partition `delete partition`
    
    - _Ensure correct partition is selected_
  
  - Assign a drive letter `assign letter=[letter]`
  
  - Format a partition `format fs=[ntfs] [label="MyLabel"] [quick]`
    
    - File system can be `ntfs`, `fat32` , `exfat`
    
    - _Omit quick for a full format_
  
  - Extend a volume `extend size=[number in MB]`
    
    - _First select the specific volume to be extended_
    
    - _There must be unallocated space to the right of the volume to extend(Contiguous)_
  
  - Shrink a volume `shrink desired=[number in MB]`
    
    - _First select the specific volume to be extended_

- Delete all partitions or volumes of a selected disk `clean`
  
  - `clean all` performs a thorough wipe of the disk making data recovery much more difficult

Example workflow to format a disk and add 2 partitions:

```batch
list disk
select disk 3
clean
create partition primary size=20000
format fs=ntfs label="ABC" quick
assign letter=X

create partition primary size=10000
format fs=ntfs label="XYZ" quick
assign letter=Z
```

### Linux

## Miscellaneous

### SQL Operations

- **Resetting SQL Auto Increment**: `DELETE FROM sqlite_sequence WHERE name='data';`

### Port forwading serveo

**SSH Command**: `ssh -R 80:localhost:<port> serveo.net`

## Docker

- In Dockerfile `CMD` any command line arguements in docker run replace the command while `ENTRYPOINT` the arguements are appended to the command.

- For networking docker containers can resolve to each other through the container name.

- For named volumes eg `docker run -v data_volume:/var/lib/mysql mysql` . This command creates a storage location at `/var/lib/docker/volumes` where the data inside the container will persist. (Volume Mounting)

- To define the location instead `docker run -v /data:/var/lib/mysql mysql`. Starts `host-file-system:container-file-system`. (Bind Mounting)

- Ports, map container ports to host port. Uses -p eg `docker run -p 8096:8096 jellyfin`. Starts `Host-port:Container Port`.

- `--restart=unless-stopped` option is best as a container will start say on reboot auto.

- Docker compose file must be named `docker-compose.yaml`. Any commands specific to it must be run in the same directory the file is in.

- To start `docker compose up -d`. To stop `docker compose down` 

- To view logs of containers started from docker compose run `docker compose logs` . Common options like `-f` apply.
