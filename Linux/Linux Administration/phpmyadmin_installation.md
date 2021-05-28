# Installing phpMyAdmin
--- 28 May 2021 ---

The comfort of interacting with MySQL through a GUI is desirable for some over 
MySQL prompt. phpMyAdmin was created for such users to safely manage db's.

## Pre-requisites

1. An Ubuntu server with a configured `ufw` firewall
1. A LAMP stack installed on Ubuntu 20.04 server

**NOTE: ** phpMyAdmin is a potential attackk surface, hence it must never be run 
over a plain HTTP connection

## Installing phpMyAdmin

`sudo apt update`

The official documentation recommends that a few PHP extensions be installed along 
with `phpmyadmin1` to enable certain functionalities and improve performance.

`sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl`

- php-mbstring - module for managing non-ASCII strings and convert string b/w 
different encodings
- php-zip - support for uploading .zip files
- php-gd - support for GD Graphics Library
- php-json - PHP support for JSON serialization
- php-curl - allows PHP to interact with different kinds of servers using different protocols

### Configuring the installation (interactive prompts)

1. For the server selection, choose `apache2`

    ***WARNING: *** When the prompt appears, "apache2 is highlighted, but not 
    selected. Hit SPACE to select Apache, then TAB followed by ENTER to select 
    Apache.

1. You will be asked a MySQL application password for phpMyAdmin. If you run into 
errors here, refer the link on how to troubleshoot the problem.

1. Enable `mbstring` and the restart Apache for your changes to be recognized

`sudo phpenmod mbstring`

`sudo systemctl restart apache2`




## Adjusting User Authentication and Privileges

phpMyAdmin automatically creates a database user called phpymadmin to perform 
certain underlying processes for the program. Its best not to use this user.

### Configuring Password Access for the MySQL ROOT Account

If you're considering using root user, then this step is required.

In Ubuntu systems running MySQL 5.7 (and later versions), the root MySQL user is 
set to authenticate using the `auth_socket` plugin by default rather than with a 
password. Although it offers greater security and usability, it complicates when 
allowing external program access.

1. Open mysql and check the authentication method for your MySQL user accounts

    `sudo mysql`

    `mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;`

    You will find an output similar to:
    ```
    +------------------+-------------------------------------------+-----------------------+-----------+
    | user             | authentication_string                     | plugin                | host      |
    +------------------+-------------------------------------------+-----------------------+-----------+
    | root             |                                           | auth_socket           | localhost |
    | mysql.session    | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | caching_sha2_password | localhost |
    | mysql.sys        | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | caching_sha2_password | localhost |
    | debian-sys-maint | *8486437DE5F65ADC4A4B001CA591363B64746D4C | caching_sha2_password | localhost |
    | phpmyadmin       | *5FD2B7524254B7F81B32873B1EA6D681503A5CA9 | caching_sha2_password | localhost |
    +------------------+-------------------------------------------+-----------------------+-----------+
    5 rows in set (0.00 sec)
    ```

2. Alter the `root` user to authenticate using a password

    `mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';`

    **NOTE: ** Although MySQL suggests using the newer `caching_sha2_password` 
    plugin, but some php versions (below 7.4) might encounter errors, in which 
    case authenticate using `mysql_native_password`

    `mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`

3. Check the authentication method for root (or the modified user). This should now 
be the chosen authentication and not `auth_socket`.

### Creating a new user and granting appropriate priveleges

Refer to source 1 for further information. You can set root privileges using the 
following command:

`GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;`

### Logging into phpMyAdmin

Log into the interface through the following link `https://<domain_name_or_IP>/phpmyadmin` either as root or the new user. The phpMyAdmin dashboard will now be 
visible.

## Securing your phpMyAdmin Instance (.htaccess)

Due to phpMyAdmin's ubiquity, one must setup Apache's `.htaccess` authentication 
to prevent unauthorized acccess.

1. Enable .htaccess file override by editing your phpMyAdmin installation's Apache 
configuration file.

    `sudo nano /etc/apache2/conf-available/phpmyadmin.conf`

    Add an `AllowOverride All` directive within the `<Directory /usr/share/
    phpmyadmin>` section of the configuration file, like this:

    ```
    <Directory /usr/share/phpmyadmin>
        Options SymLinksIfOwnerMatch
        DirectoryIndex index.php
        AllowOverride All
        . . .
    ```

1. Restart Apache to implement the changes made

    `sudo systemctl restart apache2`

1. Create a `.htaccess` file

    `sudo nano /usr/share/phpmyadmin/.htaccess`

    and enter the following information: 

    ```
    AuthType Basic
    AuthName "Restricted Files"
    AuthUserFile /etc/phpmyadmin/.htpasswd
    Require valid-user
    ```

    - **AuthType Basic** - Type of authentication, here password authentication
    - **AuthName** - Sets the message for authentication dialog box. Keep it 
    generic.
    - **AuthUserFile** - This sets the location of the password file. Should be 
    outside of the directories that being served.
    - **Require valid-user** - This specifies that only authenticated users should 
    be given access to this resource. This is what actually stops unauthorized 
    users from entering.

1. Create a `.htpasswd` file

    `sudo htpasswd -c /etc/phpmyadmin/.htpasswd <username>`

    You'll be prompted to select and confirm a password for the user you are 
    creating. Afterwards, the file is created with the hashed password that you 
    entered.

    To create additional users, run the command **without** the `-c` flag

    `sudo htpasswd /etc/phpmyadmin/.htpasswd additionaluser`

1. Restart Apache to put .htaccess authentication into effect

    `sudo systemctl restart apache2`

Now, when you try accessing the file, you'll be prompted with a username and 
password field. This adds an additional layer of security to phpMyAdmin 
(phpMyAdmin) has been known to be vulnerable in the past.



# Sources

1. (Installing phpMyAdmin) https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-20-04