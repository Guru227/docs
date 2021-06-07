# Sharing data over ftp/sftp between your local machine and the server
--- 31 May 2021 ---

## Concept of FTP and FTP ports

- network protocol over TCP/IP | client server
- `sftp` - SSH FTP

It uses two channels - *control* channel (port 21) and *data* channel (port 20).

The world has 3 types of ports:
1. well-known ports (0 - 1023)
1. registered ports (1024 - 49151)
1. dynamic ports

port 20 is used as the data port in an active FTP connection. In a passive FTP 
connection, a dynamic port is used as the data port (any random port).

scp and sftp use port 22 (ssh port).

### Active and Passive Mode Connections

1. Active Mode

Client connects to ftp server's port 21 from one of the registered ports using 
port 'n', and connects using port 'n+1' as the data and performs the handshake 
for this connection also.

1. Passive mode

First, the passive mode must enabled on the client (not enabled by default).
Using the *PASV* command, the server initiates another three-way handshake from 
a registered port to the client port for establishing the control channel. The 
data channel follows the same method as before.

## Using MobaXterm

It's quite simple actually. 
1. Just ssh into the server you want to share data with. 
1. Then, on the vertical menu, check the `follow terminal folder` at the bottom. 
1. Select the sftp tab on the vertical menu

### to download 

1. Select the folder you want to download
1. Click on the download icon which can be found on the header of the vertical 
menu

### to upload

1. move into the folder you want
1. Click on the upload icon which can be found on the header of the vertical 
menu

## using ftp (port 21)

### things to check

1. is the ftp server service running? if not, install/run the FTP server (vsftpd)
    - update system packages
    - install `vsftpd` server on Ubuntu
        `sudo apt install vsftpd`
    - launch the service and enable it at startup
        `sudo systemctl start vsftpd`
        `sudo systemctl enable vsftpd`
    - backup configuration files
        `sudo cp /etc/vsftpd.conf /etc/vsftpd.conf_default`
    - create a user if not already created

1. firewall rules
    - check if the firewall is enabled and firewall rules
        `sudo ufw status`
    - to enable the firewall 
        `sudo ufw enable/disable`
    - allow traffic on the ftp ports
        `sudo ufw allow 20`
        `sudo ufw allow 21`
        `sudo ufw allow 22` - for ssh (sftp, if you're going to configure it)

1. is the port open
    sudo netstat -ntulp
    port 21 and 22 (?)

1. can you ping the device server from the client?

1. `traceruote` if you cannot ping the server to give you further clues 

1. if telnet service is installed and running on the server, try 
    `telnet <ip> <port>`

### ftp commands

1. `ls` - to list files

1. `get <file>` - download a file from the current directory
    `mget <file1> <file2> ..` - multiple get

1. `put <file>` - to put the file on the server
    `mput <file1> <file2> ...` - multiple put






NOTE: use `sftp` if you're authenticating into the server using rsa keys
NOTE: use SEEDLABS VM's as the client to be able to check NAT connectivity, in case 
you aren't sure if the problem is on the server or the client side.

## SOURCES

1. (concept of ftp and ftp ports) https://ipcisco.com/ftp-and-ftp-ports/

1. (vsftpd and firewall rules and ftp server configuration) read://https_phoenixnap.com/?url=https%3A%2F%2Fphoenixnap.com%2Fkb%2Finstall-ftp-server-on-ubuntu-vsftpd%23ftoc-heading-4

1. (is the port open) https://askubuntu.com/questions/1030516/ssh-from-client-vm-to-a-server-vm-permission-denied

1. (ftp and sftp commands) https://devconnected.com/4-ways-to-transfer-files-and-directories-on-linux/#:~:text=Transferring%20files%20using%20sftp%20on%20Linux%201%20Connect,your%20local%20machine%20to%20your%20remote%20host.%20