# Linux Commands

The default prompt for regular user is **$** and for root user is **#**

Ex: 

    [siva@siva-mint ~]$
    [siva@siva-mint ~]#

**How to determine whether a given Linux is 32 bit or 64 bit?**

`$ uname -m`

    x86_64 ==> 64-bit kernel
    i686   ==> 32-bit kernel

**Show distribution info:**

`$ uname -a`

    Linux localhost.localdomain 4.5.7-300.fc24.x86_64 #1 SMP Wed Jun 8 18:12:45 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux

Getting Help on commands:

    $ man pwd
    $ info pwd
    $ help pwd

Go to home to home directory: `$ cd ~`

How much time it took to execute the command: `$ time pwd`

To find out where a particular command is taken from:

    $ type bash
    bash is /bin/bash

**type** command to check built-in or external command

    $ type pwd
    pwd is a shell builtin

    $ type bash
    bash is /bin/bash

To see the executed command history: `$ history`

To execute 23rd command: `$ !23`

To execute last command: `$ !!`

To edit history command by number, opens in VI: `$ fc 12`

To runs the most recent command that contains a particular string of characters: `$ !?string?`

To show current user:

    $ who am i
    siva     pts/0        2016-08-22 10:26 (192.168.56.1)

`$ grep siva /etc/passwd`

    siva:x:1000:1000:Siva:/home/siva:/bin/bash


`$ hostname`
    siva-centos7

ls command:

    $ ls -al
    $ ls --help
    $ ls --hide=Desktop

`$ date`

    Mon Aug 22 10:33:50 IST 2016

`$ date +'%d/%m/%y'`

    22/08/16

`$ date +'%A, %B %d, %Y'`

    Tuesday, October 21, 2014

`date --help`

`$ id`

    uid=1000(siva) gid=1000(siva) groups=1000(siva),10(wheel) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023

See which users logged into the system currently

    $ who -uH
    NAME     LINE         TIME             IDLE          PID COMMENT
    siva     :0           2016-08-22 10:11   ?          2575 (:0)
    siva     tty2         2016-08-22 10:12 00:29        3443
    siva     pts/0        2016-08-22 10:26   .          3935 (192.168.56.1)

List all aliases: `$ alias`

If a command is not in your PATH variable: `$ locate chage`

## Terminal shorcuts

    Alt+F => Word forward Go forward one word.
    Alt+B => Word backward Go backward one word.
    Ctrl+A => Beginning of line Go to the beginning of the current line.
    Ctrl+E => End of line Go to the end of the line.
    Ctrl+L => Clear screen Clear screen and leave line at the top of the screen.

    Alt+U => Uppercase word Change the current word to uppercase.
    Alt+L => Lowercase word Change the current word to lowercase.
    Alt+C => Capitalize word Change the current word to an initial capital

## Alias

``` bash
alias sai='sudo apt-get install'
unalias sai
```

For all users

    /etc/profile
    /etc/bashrc

User specific config files

    ~/.bash_profile
    ~/.bashrc
    ~/.bash_logout

To reload config file: `$ source ~/.bashrc`

## touch command

    $ touch memo{1,2,3,4,5}
    $ ls
    memo1 memo2 memo3 memo4 memo5

    $ touch {John,Bill,Sally}-{Breakfast,Lunch,Dinner}
    $ ls
    Bill-Breakfast Bill-Lunch John-Dinner Sally-Breakfast Sally-Lunch
    Bill-Dinner John-Breakfast John-Lunch Sally-Dinner

    $ rm -f {John,Bill,Sally}-{Breakfast,Lunch,Dinner}

    $ touch {a..f}{1..5}
    $ ls
    a1 a3 a5 b2 b4 c1 c3 c5 d2 d4 e1 e3 e5 f2 f4
    a2 a4 b1 b3 b5 c2 c4 d1 d3 d5 e2 e4 f1 f3 f5

## ls command

    $ ls -l
    total 4
    -rw-rw-r--. 1 joe joe 0 Dec 18 13:38 apple
    lrwxrwxrwx. 1 joe joe 5 Dec 18 13:46 pointer_to_apple -> apple
    -rwxr-xr-x. 1 joe joe 0 Dec 18 13:37 scriptx.sh

To show hidden and non-hidden files:: `$ ls -a`

To list all files by time most recently modified: `$ ls -at`

To list files and append file-type indicators: `$ ls -F`

`$ ls --hide=g*`

`$ ls -ld $HOME/test/`

To list all files and directories recursively from current directory down: `$ ls -R`

To list files by size: `$ ls -S`

## Permissions

First character of permission:

    hyphen (-) : a regular file
    d : a directory
    l ( lowercase L) : a symbolic link
    b (for a block device)
    c (for a character device)
    s (for a socket)
    p (for a named pipe)
    x: an executable file (a script or binary file that runs as a command)

Changing permissions with chmod (numbers)

each permission (read, write, and execute) is assigned a number

r=4, w=2, and x=1

For example, to make permissions wide open for yourself as owner, 
you would set the first number to 7 (4+2+1), and then you would give the group and others read-only
permission by setting both the second and third numbers to 4 (4+0+0), so that the final
number is 744.

    # chmod 777 file -> rwxrwxrwx
    # chmod 755 file -> rwxr-xr-x
    # chmod 644 file -> rw-r--r-
    # chmod 000 file -> ---------

All files and directories below, and including, the myapps directory

    $ chmod -R 755 $HOME/myapps

Changing permissions with chmod (letters)

user (u), group (g), other (o),all users (a).
read (r), write (w), and execute (x)

Current : (rwxrwxrwx).

    $ chmod a-w file -> r-xr-xr-x
    $ chmod o-x file -> rwxrwxrw-
    $ chmod go-rwx file -> rwx------

Current: (---------).

    $ chmod u+rw files -> rw-------
    $ chmod a+x files -> --x--x--x
    $ chmod ug+rx files -> r-xr-x---
    $ chmod -R o-w $HOME/myapps

Changing file ownership

    # chown joe /home/joe/memo.txt
    # ls -l /home/joe/memo.txt
    -rw-r--r--. 1 joe root 0 Dec 19 11:23 /home/joe/memo.txt

To change group as well

    # chown joe:joe /home/joe/memo.txt
    # ls -l /home/joe/memo.txt
    -rw-r--r--. 1 joe joe 0 Dec 19 11:23 /home/joe/memo.txt

    # chown -R joe:joe /media/myusb

Moving, Copying, and Removing Files

    $ mv abc def
    $ mv abc ~
    $ mv /home/joe/mymemos/ /home/joe/Documents/


    $ cp abc def
    $ cp abc ~
    $ cp -r /usr/share/doc/bash-completion* /tmp/a/
    $ cp -ra /usr/share/doc/bash-completion* /tmp/b/

    $ rm abc
    $ rm *
    $ rmdir /home/joe/nothing/
    $ rm -r /home/joe/bigdir/
    $ rm -rf /home/joe/hugedir/

The backslash causes any command to run unaliased.

    \rm bigdir

## VIM

    0 (zero) — Moves the cursor to the beginning of the current line.
    $ Moves the cursor to the end of the current line.

    ZZ — Saves the current changes to the file and exits from vi.
    :w — Saves the current file but doesn't exit from vi.
    :wq — Works the same as ZZ.
    :q — Quits the current file. This works only if you don’t have any unsaved changes.
    :q! — Quits the current file and doesn’t save the changes you just made to the file.

`$ locate .bashrc`

    /etc/skel/.bashrc
    /home/cnegus/.bashrc

`# locate .bashrc`

    /etc/skel/.bashrc
    /home/bill/.bashrc
    /home/joe/.bashrc
    /root/.bashrc

## find command

`# find /etc -name passwd`

    /etc/pam.d/passwd
    /etc/passwd

`# find /etc -iname '*passwd*'`

    /etc/pam.d/passwd
    /etc/passwd-
    /etc/passwd.OLD
    /etc/passwd
    /etc/MYPASSWD
    /etc/security/opasswd

Finding files by size

    $ find /usr/share/ -size +10M
    $ find /mostlybig -size -1M
    $ find /bigdata -size +500M -size -5G -exec du -sh {} \;
    4.1G /bigdata/images/rhel6.img
    606M /bigdata/Fedora-16-i686-Live-Desktop.iso
    560M /bigdata/dance2.avi

Finding files by user

    $ find /home -user chris -ls
    # find /home -user chris -or -user joe -ls
    # find /etc -group ntp -ls
    # find /var/spool -not -user root -ls

Finding files by permission

    $ find /bin -perm 755 -ls
    $ find /home/chris/ -perm -222 -type d -ls
    $ find /myreadonly -perm +222 -type f
    $ find . -perm -002 -type f -ls

Finding files by date and time

changed in past 10 minutes: `$ find /etc/ -mmin -10`

changed in the past three days: `$ find /bin /usr/bin /sbin /usr/sbin -ctime -3`

have not been accessed in more than 300 days: `$ find /var/ftp /var/www -atime +300`

The time options (-atime, -ctime, and -mtime)  based on the number of days

The min options (-amin, -cmin, and -mmin) do the same in minutes.

$ find /etc -iname iptables -exec echo "I found {}" \;

    I found /etc/bash_completion.d/iptables
    I found /etc/sysconfig/iptables

$ find /usr/share -size +5M -exec du {} \; | sort -nr

$ find /var/allusers/ -user joe -ok mv {} /tmp/joe/ \;

-ok asks for confirmation

## grep command

    $ grep desktop /etc/services
    $ grep -i desktop /etc/services

To search for lines that don’t contain a selected text string, use the -v option.

    $ grep -vi tcp /etc/services

-r : recursively

-l : list filenames only

$ grep -rli peerdns /usr/share/doc/

$ ip addr show | grep inet


## SSH Password-less login

1. Install OpenSSH on Server

ex: sudo apt-get install openssh-server
    sudo service ssh restart (or) sudo systemctl start ssh

2. On client machine, generate ssh keys

  ssh-keygen -t rsa

  Copy public key (id_rsa.pub) from client machine to server's authorized_keys.

  ssh-copy-id <username>@<ssh-server-ip>

  ssh-copy-id siva@192.168.0.103

  Now you can ssh without requiring to enter password:
  ssh siva@192.168.0.103

Note: Check configuration of SSH server in /etc/ssh/sshd_config file.
