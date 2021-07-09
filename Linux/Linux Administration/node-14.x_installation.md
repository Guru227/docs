# Installing node 14.x on Ubuntu

## Update apt index
`sudo apt update` and `sudo apt upgrade`

## Setup nodejs repository

`curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -`

Validate that the repository was added by checking file contents

`cat /etc/apt/sources.list.d/nodesource.list`

You should see an output as shown below:

```
deb https://deb.nodesource.com/node_14.x focal main
deb-src https://deb.nodesource.com/node_14.x focal main
```

## Install the repository

`sudo apt-get -y install nodejs`

Verify the installation

`node -v`


# Sources

1. (Installing Node) https://computingforgeeks.com/install-node-js-14-on-ubuntu-debian-linux-mint/
