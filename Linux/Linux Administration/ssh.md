# Everything essential related to ssh

## Generate ssh keys

### Using ssh-keygen

The default key generated by ssh-keygen is a 2048 bit key (you may optionally pass in the `-b 4096` flag to create a larger 4096-bit key).

`ssh-keygen -t rsa` (-t rsa is optional as rsa is the default key type)

Upon entering the command, you will be asked to specify the location where the key 
is to be stored. The private key is stored in `/home/<username>/.ssh/id_rsa` by 
default, and the public key in the same directory with the name `id_rsa.pub`.


## Copying the public key into the server

### Using ssh-copy-id
You will be prompted for confirmation to connect with an insecure server 
and another prompt for the password. It will scan the local account for the 
id_rsa.pub keyand copy that into the remote servers `~/.ssh/authorized keys`.

`ssh-copy-id <username>@<ip-address>`

### Copy public key using ssh
This method is used when you have password-based ssh access. First copy the 
public key, then SSH into your remote host, create the file 
`~/.ssh/authorized_keys` if not already present and then concatentate the 
public key to the file.

`echo <public_key_string> >> ~/.ssh/authorized_keys`

The public keystring looks like:

`ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0LShGgkIqd7yapjN1oIL088OiF1uTl5Ev55h/b363luT3CNkuy8hLoceUHFEnmp3sabKJtq1Q7eCmnwCWw4YJMAlijatbfZT4O5YpTbrB4Qf5jr12mU0rSoD7Cm8sTIYim7uaxYHJMHlydalxTZG219MuDuIoacaCXU8ZJQ0NdDofxrF0SXWuI3KL3lzXQ1qeEpoDYem3ZkK/SGemsLTjHg8Jmf3UnHeYdAkGBGvz+f+3gD0npZgxcPTqTtzwt8WeSn+n4/tCWu03hautyGPy4bMEQg6gMwHKmkF6Q5B/bi67q1VaBmCVX6TPDBOCtB1I4LFQSeis9kTGt4vrnuPoQ== rsa-key-20210524`

1. `ssh-rsa` is the syntax
2. The middle section is the rsa key
3. `rsa-key-20210524` is a comment to identify the key

Finally, ensure the permissions of the `.ssh` directory are set appropriately:
`chmod -R 700 ~/.ssh`
The .ssh directory should belong to the `<username>` and not `root`.
`chown -R <username>:<username> ~/.ssh`

## Passwordless authentication to Ubunutu server using SSH keys

After following the above steps, you can ssh into the remote host without the 
remote host without the remote account's password.

`ssh <username>@remote_host` where remote_host is the IP-address or URL

If you didn't supply a passphrase for your private key, you will be logged in 
immediately.

## Disable Password Authentication on your server

Now, after setting up ssh, you should be able to sign in without a password. But, 
the server is still exposed to brute-force attacks. This step is to be performed after setting up SSH-based authentication for a *non-root user with sudo privileges*.

Log into the remote server and in the `/etc/ssh/sshd_config` file, edit the directive called `PasswordAuthentication` to say "no". It should look like:

```
...
PasswordAuthentication no
...
```

Then, restart the sshd service:
`sudo systemctl restart ssh`

As a precaution, ssh through another terminal and ensure it is working.

## Starting/restarting/enabling the ssh server

1. `sudo systemctl [start|restart|stop|status|enable|disable] ssh`

1. check if server is running - `sudo systemctl status ssh`

# Sources
1. (SSH-based authentication) https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-1604#:~:text=1%20Create%20the%20RSA%20Key%20Pair.%20By%20default,you%20have%20successfully%20configured%20SSH-key-based%20authentication%20to%20

1. (starting/restarting/enabling the ssh server) https://www.simplified.guide/ssh/restart-service#:~:text=How%20to%20start%2C%20restart%20and%20stop%20SSH%20service,service%20command%20%20%20service%20ssh%20%5Bstart%7Crestart%7Cstop%7Cstatus%5D%20