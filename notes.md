# Notes

1. [Linux OS](#linux-os)
   - [Service Management](#service-management)
   - [File Management](#file-management)
   - [Packages](#packages)
   - [Shell Operations](#shell-operations)
   - [Crontab](#crontab)
2. [Windows OS](#windows-os)
   - [Battery Info](#battery-information)
3. [SSH](#ssh)
4. [Git](#git)
5. [Disk Management](#disk-management)
6. [Miscellaneous](#miscellaneous)
   - [SQL](#sql-operations)
   - [Port forwading](#port-forwading-serveo)

## Linux OS

### Service management

- Use [_stacer_](https://github.com/oguzhaninan/Stacer) to view all running processes or [_htop_](https://github.com/htop-dev/htop).

#### Systemctl

- _Requires super user access_

- Check a service `systemctl status <servicename>`
  
  - `Enabled/ Disabled` - _Whether the service starts on startup_

- Start, stop and restart a service `sudo systemctl start/stop/restart <servicename>` respectively.

- Enable and disable a service `sudo systemctl enable/disable <servicename>`

#### Journalctl

- _Requires super user access_

- Type / to search for a specicic keyword _case sensitive_

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
- **Install .deb Package**: Use `sudo dpkg -i <package path>` (e.g., `sudo dpkg -i /home/abc/Downloads/package.deb`).

### Shell Operations

- **Default Shell**: The default shell is `bash`.

- **Adding Aliases**: Add aliases in `.bashrc` or `.bash_aliases` file.

- **View Aliases**: Type `alias` to view all saved aliases.

- **Check Current Shell**: Type `echo $SHELL` to check which shell is in use.

- **Changing Default Shell**: To change the default shell of a user, modify it in `/etc/passwd` (requires root).
  
  <hr/>

- **History Command**: Shows all commands used.

- **Run Command from History**: Use `!(number)` (e.g., `!566` to run command 566).

- **Hide Command from History**: Add a space before the command.
  
  <hr/>

- Use [this prompt generator](https://bash-prompt-generator.org/) to generate a custom PS1 prompt.

### Crontab

- **Edit Crontab**: `crontab -e` (open crontab for editing).
- **List Crontab**: `crontab -l` (list crontab entries).
- To generate a crontab entry use [this crontab generator](https://crontab-generator.org/).

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
  ```

- Can now login using `ssh debianhome`.

- Use `ssh-keygen` to generate an ssh key.

- Either copy the public key to the `.ssh/authorized_keys` file on the remote server or use this command ;
  
  `ssh-copy-id -i /path/to/idiw.pub key username@hostname` eg. `ssh-copy-id -i ~/.ssh/id_rsa.pub abc@192.168.0.103`

- ssh-keygen options:
  
  - -C "Comment"
  
  - -t ed25519 _encryption type_

- ssh server configuration file location `/etc/ssh/sshd_config` , on termux this file can be located at `/data/data/com.termux/files/usr/etc/ssh`.
  
  ##### NB
  
  - _Use a passphrase for an added layer of security_
  
  - **After configuting ssh keys** _disable password authentication and if possible also disable root login for more security._
  
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

### Miscellaneous-git

- _To switch to a branch that only exists in the remote first do a `git fetch` then `git switch -t origin/<branch-name>`_

- _To track files not in that directory use a symlink(shortcut) to point to that file._

## Disk Management

- Use [disk drill](https://drive.google.com/file/d/1ztaaO9CBkXhGeojjeinbPzfPYUiEyDf2/view?usp=drive_link) to recover files and basically manage the drives.

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
    
    - \*File system can be `ntfs`, `fat32` , `exfat`
    
    - _Omit quick for a full format_
  
  - Extend a volume `extend size=[number in MB]`
    
    - _First select the specific volume to be extended_
    
    - _There must be unallocated space to the right of the volume to extend(Contiguous)_
  
  - Shrink a volume `shrink desired=[number in MB]`
    
    - _First select the specific volume to be extended_

- Delete all partitions or volumes of a selected disk `clean`
  
  - `clean all` performs a thorough wipe of the disk making data recovery much more dificult

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

- **SSH Command**: `ssh -R 80:localhost:<port> serveo.net`
