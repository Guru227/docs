# Installing jenkins on Ubuntu 20.04
--- 09 June 2021 ---

Jenkins is an open-source automation server which can be used to efficiently 
manage tasks from building to deploying software. Jenkins is Java-based, 
installed from Ubuntu packages or by downloading and running its web application 
archive (WAR) file - a collectioln of files that make up a complete web 
application to tun on a server.

Apart from installing Jenkins, its important to configure a reverse proxy to 
secure the installation.

## Pre-requisite

1. JDK 11 (open JDK is fine)
    ` sudo apt install default-jre default-jdk`

    Check java version
    `java -version` & `javac -version`


## Installing Jenkins

The version of Jenkins included with the default Ubuntu packages is often behind 
the latest available version from the project itself. To ensure you have the 
latest fixes and featues, use the project-maintained packages to install Jenkins.

1. Add repository key to the system

    `wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -`

    After the key is added, the system will return with `OK`

1. Append the Debian package repository address to the server's `sources.list`

    `sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'`

1. After both commands have been run, run `update` so that `apt` will use the new 
repository.

    `sudo apt update`

    You will find a few hits with a jenkins URL.

1. Finally, install Jenkins and its dependencies

    `sudo apt install jenkins`


### Starting Jenkins

1. You can start Jenkins using `systemctl`. In Ubuntu, the service is 
automatically started. But in many Linux systems, you need to start the service 
after installation.

    `sudo systemctl start jenkins`

1. Check the status of the service

    `sudo systemctl status jenkins`

    The output should be similar to this if everything went well.

    ```
    ● jenkins.service - LSB: Start Jenkins at boot time
     Loaded: loaded (/etc/init.d/jenkins; generated)
     Active: active (exited) since Wed 2021-06-09 11:18:07 UTC; 1min 42s ago
       Docs: man:systemd-sysv-generator(8)
      Tasks: 0 (limit: 1160)
     Memory: 0B
     CGroup: /system.slice/jenkins.service
    ```

### Opening the Firewall

This step isn't usually required with an EC2 instance because the firewall is 
controlled using security groups. But if it's a standalone server, then you need 
to do this.



### Setting Up Jenkins

1. To set up your installation, visit Jenkins on its default port, 8080, using  
your server domain name or IP address: `http://<server-or-ip-address>:8080`

    **NOTE:** when checking if you can connect to Jenkins on EC2 instance, make 
    sure you don't use `http://` before the IP address. Simply use 
    `<ip-address>:8080`.

1. You should receive the **Unlock Jenkins** screen which displays the location 
of the initial password.

    The *Administrator Password* can be found at the location it asks you to look 
    into which is usually the same. Run the following command:

    `sudo cat /var/lib/Jenkins/secrets/initialAdminPassword`

1. "Install suggested plugins"

1. Once the installation is complete, you'll be prompted to set up the first 
administrative user. It's possible to skip this step and continue as `admin` 
using the initial password we used above, but we'll take a moment to create the 
user.

1. Then, in the instance configuration page you will be asked to confirm the 
preferred URL for your Jenkins instance. Confirm either the doamin name for your 
server or your server's IP address

1. You're finished with installation!



## Configure Jenkins with SSL using an Apache Reverse Proxy

When you're configuring Jenkins to be more secure using SSL and a reverse proxy,
we first configure the latter, and then the former. When you're using AWS, 
setting up a load balancer that uses SSL is simpler and more secure for your 
entire application than securing individual servers. Over here, that is the 
method we will employ.

### Configuring the Reverse Proxy

1. SSH into the server running jenkins and move into the 
`/etc/apache2/sites-available` directory

1. Create a copy of the `000-default.conf` file and rename it to be 
`<website-url>.conf`
    
    In the conf file, configure it as below

    ```
    ServerAdmin webmaster@localhost
    #DocumentRoot /var/www/html
    ServerName              <website-url>
    ProxyPass               / http://localhost:8080/ nocanon
    ProxyPassReverse        / http://locahost:8080/
    ProxyRequests           Off
    AllowEncodedSlashes NoDecode  
    ```

    The `DocumentRoot` line should be commented. The ServerName should be the 
    <website-url>. As Jenkins will be running on port 8080 of localhost, it is 
    configured as shown. If you will configure it to be running on any other port, then it should be changed as required. Leave the last two lines as it 
    is.

1. Enable Proxy Mode on your server after finishing up with the configuration 
file.

    `sudo a2enmod proxy_http`

1. Move into the `/etc/apache2/sites-enabled` directory. If it's a fresh install, 
you should be seeing the link to `000-default.conf` file from the 
`sites-available` directory. You can delete this link using

    `sudo unlink 000-default.conf`

    If it's not a fresh install and there are other configured sites, leave them 
    untouched if you don't know what you're doing.

    Then, create a soft link to the configuration created for your jenkins 
    website.

    `sudo ln -s ../sites-available/<website-url>.conf`

1. Check the syntax of your configuration files by running

    `sudo apache2ctl -t`

    If there are no errors with your syntax, then you will receive an `OK` 
    message.

1. With this, the reverse proxy has been configured. But, we have one last step 
before restarting the apache server and that is to make jenkins run on the 
localhost. In the `/etc/default/jenkins` file, locate the `JENKINS_ARGS` line and 
add `--httpListenAddress=127.0.0.1` to the existing arguments. So it should look 
similar to:

    `JENKINS_ARGS="--webroot=/var/cache/$NAME/war --httpPort=$HTTP_PORT --httpListenAddress=127.0.0.1"`

    Save and Exit the file.

1. To use the new configurations, restart jenkins and apache server, check the 
status of the services, and finally check if the ports are open using `netstat`.

    `sudo systemctl restart jenkins` & `sudo systemctl restart apache2`

    `sudo systemctl status jenkins` & `sudo systemctl status apache2`

    `sudo netstat -ntulp`


(NOT TESTED, BUT SHOULD WORK) After setting up the reverse proxy, you should be 
able to see Jenkins if you enter the IP address of the website without port 8080, 
assuming there are no other virtual hosts running on the machine. This could 
serve as another clear indication that the reverse proxy is working.


### Using SSL in AWS

To set up SSL you will need a domain name. You can generate an SSL certificate 
using AWS certificate manager and then use this certificate with a load balancer. 

So, the pre-requisites in order are:

1. Own a domain
1. Create an SSL certificate using AWS certificate manager for your domain name
1. Create a load balancer and use the SSL certificate

**NOTE:** You will have to create a `Target Group` containing the EC2 instance 
running the *Jenkins Instance*. In case you have incorrectly configured 
your target group, you can delete it and create a new one from `Target Group` 
within `EC2` or you can simply edit the current one to the right configuration.

**NOTE:** When configuring the target group's protocol, this is the protocol that 
the load balancer will be using to communicate with the instance. In most cases, 
this is HTTP.

After completing these steps, you will have to create the following rules on the 
port 443. 

1. Click on `View/Edit Rules` under HTTPS/443.

1. Add a new rule

1. The *if* clause should be checking for **host** with a value of the domain you 
have set up for jenkins. *Then* clause should **forward** the data to the 
instance running jenkins.

1. Ensure that the security checks for the target group and the load balancer 
have all passed. Also ensure that the DNS points to the load balancer for the 
chosen URL (should use a CNAME record). Finally, visit the URL to see if it works.



### Configuring Apache to use SSL

To configure one server to use Apache, you might want to follow the steps as 
described in the link "Securing nginx with Let's Encrypt on Ubuntu 20.04". 
Although it describes the steps for an nginx server, the steps should be largely 
similar.



# Sources

1. (Installing Jenkins) https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04

1. (Setting up a Reverse Proxy for Jenkins) https://www.digitalocean.com/community/tutorials/how-to-configure-jenkins-with-ssl-using-an-nginx-reverse-proxy-on-ubuntu-20-04

1. (Enabling Proxy Mode - ProxyPass error) https://serverfault.com/questions/715905/why-am-i-getting-an-invalid-command-proxypass-error-when-i-start-my-apache-2

1. (Securing nginx with Let's Encrypt) https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04