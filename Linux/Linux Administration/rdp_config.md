# Configuring Remote Desktop Connection on Ubuntu Server

## Pre-requisites

1. Server running Ubuntu 20.04 with a minimum of 2GB RAM
1. Access to server as a `non root sudo user`

## Steps

### Installing xRDP on Ubuntu 20.04

1. Install xRDP on Ubuntu 20.04

    `sudo apt update`

    `sudo apt -y install xrdp`

    Ensure the service is running using `sudo systemctl status xrdp`.

1. Setup SSL certificate

    xRDP needs to use the `/etc/ssl/private/ssl-cert-snakeoil.key` file and to do 
    so it needs to be added to the **ssl-cert** group.  
    `/etc/ssl/private/ssl-cert-snakeoil.key` is used when no other SSL 
    certificate is installed or configured, but encrypted communication is still 
    enabled and desired. It still encrypts traffic, however since it lacks a root 
    authority signature, it is still vulnerable to most man-in-the-middle 
    attacks. This is why it is called **snakeoil**.

    `sudo adduser xrdp ssl-cert`

    Restart xrdp tp apply changes

    `sudo systemctl restart xrdp`

1. Configure firewall 

    On AWS, simply configure the inbound rules for the virtual machine.

    If you're running `ufw`, then allow port 3389 from a particular IP as 
    shown below:

    `sudo ufw allow from <ip-addr> to any port 3389`

    Or from any IP address

    `sudo ufw allow 3389`

1. Configuring xRDP (optional)

    xRDP does not require custom configuration be default, however you can 
    customize it by editing the following file:

    `sudo nano /etc/xrdp/xrdp.ini`

    NOTE: Restart the xrdp service after editing `xrdp.ini` file.

### Install your preferred Desktop Environment

1. Install xfce4 desktop environment

    `sudo apt install xfce4`

    NOTE: You can setup and switch between desktop environments as well.

### Connect to your Remote Desktop using xRDP

    You can connect to the Remote Desktop using Windows, Linux, MacOS or even Android. Here, we'll be discussing how we can achieve this with windows.

    RDP client is already installed in Windows. Just run `Remote Desktop 
    Connection` and the app will open. In the field *Computer*, enter the IP 
    address of the host. When you're asked about testing the host's certificates, 
    click on yes. You will be asked login credentials before sign in. Just enter 
    details and you're good to go!

***NOTE: *** As it's a server, none of the GUI applications have been installed. 
Only the Desktop Environment has been installed. For the desktop applications to 
work, you will need to install them following this installation.

## Troubleshooting

### xRDP disconnects immediately after connection

1. Stop xRDP with `sudo service xrdp stop`

1. Edit the xrdp start script: `sudo nano /etc/xrdp/startwm.sh`

    Comment out the following lines (by adding # at the beginning)

    ```
    test -x /etc/X11/Xsession && exec /etc/X11/Xsession
    exec /bin/sh /etc/X11/Xsession
    ```

    with 

    `startxfce4`

1. Restart xrdp with `sudo service xrdp start`

    



## Sources

1. (Installing xRDP) https://bytexd.com/xrdp-ubuntu/
1. (Comparing and Installing Desktop Environment) https://bytexd.com/install-desktop-environment-gui-ubuntu/
1. (Troubleshooting - xRDP disconnects immediately after connection) https://unix.stackexchange.com/questions/523152/xrdp-disconnects-immediately-after-connection-from-windows10-centos-to-centos7
