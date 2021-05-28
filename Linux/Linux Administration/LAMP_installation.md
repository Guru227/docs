# Installing the LAMP stack
--- 28 May 2021 ---


LAMP is an acronym for
- Linux Operating System
- Apache HTTP server
- MySQL database management system
- PHP programming language (backend-scripting layer)

## Update Package repository cache
`sudo apt-get update`

## Install Apache

1. Install apache
    `sudo apt-get install apache2`

1. Check Apache Service Status

    Upon successful installation, the following command should output `Active:
    active (running)` status.

    `systemctl apache2 status`

1. Ensure UFW firewall has an application profile for Apache

    Next, make sure that the UFW firewall has an application profile for Apache by examining the output of the following command.

    `sudo ufw app list`

    It should show:

    `
    Apache  -> this profile opens only port 80
    Apache Full -> this profile opens port 80 and 443
    Apache Secure -> this profile opens only port 443
    `

    In case it isn't, then allow the Apache profile.

    `sudo ufw allow in "Apache"`

    Verify the change with the following command. Is should have an `ALLOW` 
    against the Apache entry.

    `sudo ufw status`

    In the apache full profile, make sure it allows the traffic on ports 80 and 443. 
    The output shoukd say `Ports: 80, 443/tcp`.
    
    `sudo ufw app info "Apache Full"`

1. Ensure server is working

    Enter IP address (localhost if on host machine), and you should see the apache test webpage.

## Install MySQL and create a database

`sudo apt install mysql-server`

You could look into a step for securing the vulnerabilities of the mysql server 
by using `sudo mysql_secure_installation` and setting up a password for it. 
Details can be found in source (1).

Next, test if you're able to log into MySQL console.

`sydo mysql`

Should show an output similar to:

```
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 22
Server version: 8.0.19-0ubuntu5 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

`exit` to exit the console.

## Installing PHP

`sudo apt install php libapache2-mod-php php-mysql`

- **php** - all dependencies and core packages will be installed
- **libapache2-mod-php** - enables Apache to handle PHP files
- **php-mysql** - php module that allows PHP to communicate with MySQL-based db's

Check installation by running:

`php -v`

## Create a Virtual Host for your website

You can create virtual hosts (similar to server blocks in Nginx) to encapsulate 
configuration details and host more than one domain from a single server.

Apache on Ubuntu 20.04 has one ***server block*** enabled by default that is 
configured to server documents from the `/var/www/html` directory. While this 
works for a single site, it can become unwieldy if you are hosting multiple 
sites. Instead of modifying `/var/www/html`, we'll create a directroy structure 
within `/var/www` for the <domain_name> site, leaving `/var/www/html` in place as 
the default directory to be served if a client request does not match any other 
sites.

1. Create the directory, and assign ownership to the current system user:

    `sudo mkdir /var/www/<domain_name>`

    `sudo chown -R $USER:$USER /var/www/<domain_name>`

1. Open a new configuration file in Apache's `sites-available` directory.

    `sudo nano /etc/apache2/sites-available/<domain_name>.conf`

    Paste in the following barebones configuration.

    ```
    <VirtualHost *:80>
        ServerName <domain_name>
        ServerAlias www.<domain_name>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/<domain_name>
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>
    ```

    To test Apache wihtout a domain name, comment out the options `ServerName` and 
    `ServerAlias`.

1. Enable the virtual host

    `sudo a2ensite <domain_name>`

1. Without a DNS configuration

    If you aren't using a custom domain name, then you must disable your default 
    website.

    `sudo a2dissite 000-default`

1. Ensure that the configuration file doesn't contain any syntax errors.

    `sudo apache2ctl configtest`

1. Reload Apache

    `sudo systemctl reload apache2`

1. Create your test webpage

    The new website is now active, but the web root `/var/www/<domain_name>` is 
    still empty. Create an `index.html` file to test the virtual host. Test it by 
    visiting the webpage.

### Note about `DirectoryIndex` on Apache

With the default DirectoryIndex settings on Apache, `index.html` takes precedence 
over `index.php` files. This is usefule for setting up maintenance pages in PHP 
applications by creating a temporary `index.html` file.

This behaviour can be changed in the `/etc/apache2/mods-enabled/dir.conf` file by 
modifying the order in which the `index.php` file is listed within the 
`DirectoryIndex` directive:

```
<IfModule mod_dir.c>
        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
```

After saving and closing the file, reload (not restart) apache

`sudo systemctl reload apache2`

## Testing PHP processing on your web server

Create a new file `/var/www/<domain_name>/info.php` with the following contents.

```
<?
phpinfo()
?>
```

Upon browsing the webpage, you should see the phpinfo page. **Note: ** Sensitive 
information is displayed on this page. It's best to remove this page immediately 
after testing it.

## Testing Database Connection from PHP

### Creating test database and test user

1. Create a test database and a user with access to it
    Connect to the MySQL console using the root account. Create a new database, a 
    new user with permissions over the created database.

    `mysql> CREATE DATABASE example_database;`

    `mysql> CREATE USER 'example_user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';`

    `mysql> GRANT ALL ON example_database.* TO 'example_user'@'%';`

    Exit mysql using `exit`.

1. Test user access

    `mysql -u example_user -p` -> the p flag will prompt you for the password

    After logging in, confirm access to the example_database by executing:

    `mysql> SHOW DATABASES;`


1. Create a table, populate it and confirm that data was saved successfully

    `mysql> CREATE TABLE example_database.todo_list ( item_id INT AUTO_INCREMENT,content VARCHAR(255), PRIMARY KEY(item_id) );`

    `mysql> INSERT INTO example_database.todo_list (content) VALUES ("My first important item");`

    `SELECT * FROM example_database.todo_list;`

    `exit` mysql console.

### Creating a test PHP script

Create a new php file `/var/www/<domain_name>/todo_list.php` and copy the following 
content into it.

```
<?php
$user = "example_user";
$password = "password";
$database = "example_database";
$table = "todo_list";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
  echo "<h2>TODO</h2><ol>";
  foreach($db->query("SELECT content FROM $table") as $row) {
    echo "<li>" . $row['content'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>
```

Access the file through your web browser or elinks. If you see the contents of the 
database, then the PHP environment is ready to connect and interact with your 
MySQL server.


## Soruces
1. (Installing Lamp Stack) https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04