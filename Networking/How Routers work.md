# How do Routers work

## What are routers?

Routers are devices that work to get information between networks.

### A classic scenario

Let's look at what a very simple router might do. Imagine a small company that makes animated 3-D graphics for local television stations. There are 10 employees of the company, each with a computer. Four of the employees are animators, while the rest are in sales, accounting and management. The animators will need to send lots of very large files back and forth to one another as they work on projects. To do this, they'll use a network.

When one animator sends a file to another, the very large file will use up most of the network's capacity, making the network run very slowly for other users. One of the reasons that a single intensive user can affect the entire network stems from the way that Ethernet works. Each information packet sent from a computer is seen by all the other computers on the local network. Each computer then examines the packet and decides whether it was meant for its address. This keeps the basic plan of the network simple, but has performance consequences as the size of the network or level of network activity increases. To keep the animators' work from interfering with that of the folks in the front office, the company sets up two separate networks, one for the animators and one for the rest of the company. A router links the two networks and connects both networks to the Internet.

## Directing Traffic

The router route data packets to the destination by loooking at the recipient's address. One of the tools the router uses to determine where a packet should go is a ***configuration table***. A configuration table holds:

- Information on which connections lead to particular groups of addresses
- Priorities for connections to be used
- Pules for handling routine and special cases of traffic

A router, then, has 2 jobs:

1. Ensure that the data packet reaches the destination node
2. Ensure that the data packet does not go anywhere else, thereby preventing the clog of 'innocent bystanders'.

A router, apart from routing traffic, also performs translation of protocols when required before it is shared between the networks.

## Transmitting Packets

Data packets travel across the Internet over a system known as the ***packet switching network***. In this system, the information is broken down into packets and sent across the network, with each packet taking the most efficient route to the destination at the time it was sent. This gives 2 main advantages over a standard Telephone network, viz:
1. The network can balance the load on a millisecond basis.
2. If there is network problem, the packets being transferred can be rerouted midway, thereby ensuring the delivery of the entire message.

## Size of routers

1. Routers can be a simple software running in the backgorund like *Internet Connection Sharing* on Windows computers

2. Medium-sized routers to connect a small office to the internet which performs other functions like security checks. Usually a stand-alone device.

3. Large routers used to handle data at the major traffic points on the internet that work to configure the etwork most efficiently. These routers have more in common with a super computer than an office server.

## Routing Packets: an example (Page 6)

The router prioritises faster network connections over slower connections, but stores all of them to have any fallback connections when required.

The router also has rules limiting how computers from outside can access computers inside the network. It also has some security functions important to keep the network secure even with a firewall.

The router also determines which packet of information stays in the local network using *subnet masks*. The subnet mask looks like an IP address and usually reads 255.255.255.0. This tells the router that all messages having senders and receivers with the same first three numbers belong to the same network and shouldn't be sent outside.

Usually data packets pass through many routers on the internet before they reach the recipient from the destination.

## Knowing where to send data

Huubs, switches and routers make up the plumbing of a computer network, but the last is the only one which examines each bundle of data as it passes and makes a decision about where exactly it should go. To make these decsisions, it should know two kinds of information: addresses and network structure.

The *logical address* lets someone know who to get information to you, like your postal address. The *physical address* AKA *MAC Address* is unique to the piece of equipment - the firsst 3 bytes indentifies the manufacturer, and the next 3 bytes the device (NIC) itself.

### Logical Addresses

A computer can have many logical addresses at the same time, similar to having your postal address, and telephone number; the difference here being they use different networks.

You can have an address that is used to connect you to TCP/IP network protocal to access the internet, another as part of your local network, and maybe even one more `Novell's IPX/SPX protocol` to connect to your office.

### MAC Addresses

Ususally MAC addresses are usually not required because router software will do the job of matching MAC addresse to logical addresses. To see the MAC address in a windows PC, use the following command on cmd `ipconfig /all`.

NOTE: `wi-fi direct virtual adapter` is used to create portable hotspots from your PC. 

The Ip address is assigned to you by the ISP or the network administrator with a lease time.

***NOTE:*** You should be very careful about giving your computer's information to other people - with your address and the right tools, someone can gain access to your personal information and even control your system through a `Trojan Horse` program.

## Understanding the protocols

Routers are programmed to understand the most common network protocols. That means they know the format of the addresses, how many bytes are in the basic package of data sent out over the network, and how to make sure all the packages reach their destination and get reassembled. Not only do they route it to the destination, they route it over the best possible one.

### Tracing a packet

`Tracert <website name>` <br>
Exapmle: <br>
`Tracert www.google.com`

## Denial of Service Attacks (DoS Attacks)


`Denial of Service Attacks` are attacks where a couple of people send multitude of packets to a particular router, thus preventing it from serving the other requests properly.

Flooding of the servers and the routers attached to it with service requests at a rate far larger than their ability to handle them.

Most routers have rules in the configuration table that won't allow millions of request from the same IP in a short period of time. KNowing this, hackers planted programs on computers that sent messages to one or more websites with 'spoofed' IP addresses.

When so many requuests were triggered and a packet flood resulted, the routers couldn't manage them and sent out status messages saying that the connection was full. The legitimate requests were blocked and the web content could not be retrieved.

New rules have then been designed to prevent DoS attacks and computers now have software to detect DoS programs.

## Backbone of the internet

Some of the largest routers used in the internet use the same processors as used by supercomputers, for example Cisco's Gigabit Switch Router 12000 series.