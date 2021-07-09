# User Administration in Ubuntu

## Create user
> ``` adduser <username> ```

Upon running this, the creation of a user with the username will begin. You must 
then enter and re-enter the ***password*** of the user. Then, input any details of the 
user you deem necessary. Finally, confirm the details of input and enter 'y'.

### Verify user creation

 ```grep '^<username>' /etc/passwd```

You should be able to see an entry having the same username

## Switching user

You can switch user in the terminal using the command:

```su - <username>```

Type in the password when prompted for it.

## Remove user

1. Lock the user - this denies entry of the user into his/her account

    ```passwd -l <username>```

1. Kill all running processes of the user

    List all user processes.

    `ps -u <username>`      OR      `top -U <username>`

    Killall user processes. -9 is the SIGKILL command which tells the system to 
    terminate the processes without cleaning up.

    `killall -9 -u`

    OR

    `killall --user <username>`

1. Backup user data using tar (Optional)

    `tar cvjf backup.tar.bz /home/<username>`

1. Delete user cron jobs (If applicable)

    To delete cron jobs: 
    `crontab -r -u <username>`

    To erase printer jobs: 
    `lprm <username>`

1. Delete/remove user account (and files)

    To purge the home directory along with the user, use the `-r` flag. To retain 
    the home directory, run it without the flag.

    `userdel -r <username>`

## Add user to sudo group
The `-aG` option tells it to *append* the user to the specified *group*

`sudo usermod -aG sudo <username>`

***Verify using:***

`groups <username>`

and by accessing the `/root` directory which normally requires sudo permissions

`cd /root`







## Source:
1. (remove user) https://linoxide.com/how-delete-remove-user-ubuntu/#:~:text=How%20to%20Delete%20%28Remove%29%20a%20User%20on%20Ubuntu,or%20erasing%20user%20accounts%20from%20the%20system.%20

1. (add user to sudo group) https://phoenixnap.com/kb/how-to-create-sudo-user-on-ubuntu

1. (kill all processes of user) https://unix.stackexchange.com/questions/35131/kill-all-process-of-particular-user-in-ubuntu