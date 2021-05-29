# Creating a mongodb aws bitnami instance

## Setup the instance

Create a `bitnami mongo` instance from the aws marketplace. Make sure to create the 
necessary ssh permissions and select the appropriate security key. t2.small and 
25GB of space should be sufficient for initial setup.

## ssh into the instance

Use the private key and the username `bitnami` to ssh into the instance. Then, 
record the mongodb credentials using `sudo cat bitnami_credentials`. These are the 
authentication credentials required for accessing the admin database on mongo.

Using `netstat -ntulp` ensure that the mongodb server is up and running.

## Create rules on the security group for incoming mongodb connections

It's preferrable to create singular connections to the database for each user 
as its a potential attack surface. So, specify each systems IP address in the form 
of `xxx.xxx.xxx.xxx/32` and set the port as `27017`. This is the default port for 
connecting to the mongo database.

## Connect to the mongodb instance

You can connect to the mongodb instance using a GUI interface like `mongodbcompass` 
or `robo 3t`. Install either of these two interfaces and then establish the 
connection in it. Do this with the following steps.

1. Create a new connection
1. Setup a direct connection, and name it what you want.
1. Specify the IP address and port number
1. Enable Authentication and connect to the `admin` database
1. Specify the username and password as was stored in the `bitnami_credentials` file
1. Set the `Auth-Mechanism` as `SCRAM-SHA-256`
1. Test and save the connection

If you have access to only a specific database, then specify the database as well.

It should open up the database. If it doesn't, make sure you can reach the server 
using `telnet`, check the firewall rules for the port `27017` and make sure the 
credentials are correct. 

