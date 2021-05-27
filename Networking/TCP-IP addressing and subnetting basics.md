# TCP/IP addressing and subnetting basics

When you configure the TCP/IP protocol, an IP address, subnet mask and usually a default gateway are required in the TCP/IP configuration settings.

TCP/IP can connect together differnt networks of differnt sizes and systems of different types. They are classified into 3 main classes (along with a few others), each of which can be defined into sub networks by system administrators.

A subnet mask is used to divide an IP address into 2 parts: the host and the network it belongs to.

## IP addresses: Networks and Hosts

IPv4 addresses are four numbers delimited by dots. Each number is represented by a binary octet, making a total of 32 bits for each Ip address. For a TCP/IP Wide Area Network (WAN) to work efficiently as a collection of networks, the routers that passs packets of data between networks do not know the exact location of a host for which packet of information is destined. The router's routing/configuration table knows which network the host is a part of, and so routes it to the network. Then, the router part of the host's network forwards the packet to the host computer.

## Subnet Mask

The subnet mask is another set of four 8-bit numbers delimited by dots, similar to the IPv4 number used to dertermine whether a host is on the local network or on a remote network.

> 11000000 . 10101000 . 01111011 . 10000100 -- IP address (192.168.123.132) <br>
> 11111111 . 11111111 . 11111111 . 00000000 -- Subnet mask (255.255.255.0)

Using this we can get the Network address and Host address using AND and NOT gates:

> 11000000 . 10101000 . 01111011 . 00000000 -- Network address (192.168.123.0)<br>
> 00000000 . 00000000 . 00000000 . 10000100 -- Host address (000.000.000.132)

*NOTE*: An IP address with host address all zeroes (to specify network) and all ones (to broadcast to all devices on network) cannot be assigned to a host.

### Subnetting

The system administrator can use some of the bits from the host address to denote a subnetwork. Example, using 255.255.255.192 as a subnet mask

| Decimal | Binary |
| --- | --- |
| 255.255.255.192 | 1111111.11111111.1111111.11000000 |
| 255.255.255.224 | 1111111.11111111.1111111.11100000 |

The first two bits of the last octet are used to specify 4 different subnetworks.

> 192.168.123.1-62 <br>
> 192.168.123.65-126 <br>
> 192.168.123.129-190 <br>
> 192.168.123.193-254 <br>

*Note:* that binary host addresses with all ones or all zeros are invalid, so you cannot use addresses with the last octet of 0, 63, 64, 127, 128, 191, 192, or 255.

## Network Classes

Internet addresses are allocated by InterNIC, the organisation that administers the Internet. These IP addresses are divided into classes, the most common ones being A, B and C; D and E are not available to end-users.

1. Class A: default subnet mask of 255.0.0.0 and have 0 - 127 as their first octet.
2. Class B: default subnet mask of 255.255.0.0 and have 128-191 as the first octet.
3. Class C: 255.255.255.0 and have 192-223 as their first octet.

## Default Gateways

If a TCP/IP computer needs to communicate with a host on anotehr network, it will usually communicate through a router. In TCP/IP terms, a router that is specified on a host, which links the host's subnet to other networks, is called the default gateway.

If the result of the subnet mask comparison shows that the host lies in the LAN, then the data packet is directly sent to it, else the router forwards it to the right subnet.

## Public and Private IP adresses

Out of the 2 types of IP adresses, Public IPs are used by routers and by computers connected directly to DSL modems (Digital Subscriber Line Modem - used to connect a computer to a telephone line which provides connection to the Internet. AKA DSL Broadband).

Private IP addresses are used by Local Networks connected by a router. A website will deliver data to the router, which will then route it to the host with the private IP. The private IP is not visible to the internet.

Routers are special becasue they have two IP addresses assigned to each interface - a WAN interface which faces the internet and the LAN interface which faces the LAN (having a private IP).

## Assigning IP addresses to computers dynamically

In dynamic IP assignment using the Dynamic Host Configuration Protocol (DHCP), the router assigns IP addresses to each host from a pool of IP addresses on a home network.

After a computer disconnects from the router, the Ip is available for another computer to use. Such IP's need not be configured manually.

## Static IP Addresses

A static IP address has to be manually confiugred on the device that is going to use it. By connecting directly to a DSL service, you will get a static IP address.

But, this setup has security implications. The computer is prone to attacks without a firewall. Which is why, it is always a good idea to use a router even if you only want to connect one computer to the internet, because computers usually have a builtin firewall.

The WAN interface used to be a static IP address, but nowadays, like Jio, dynamically assigns these IP address.

## Network Address Translation (NAT)

Network Adress Translation (NAT) is a method of remapping an IP address sapce into another by modifying network address information in the IP header of packets while they are in transit across a traffic routing device.

This technique was originally used to avoid the need to assign a new address to every host when a network was moved, or when the upstream Internet Service Provider was replaced, but could not route the network address space. It has become a popular and essential tool in conserving global address space in the face of IPv4 address exhaustion. One internet-routeable IP address of a NAT gateay can be used for an entire private network.

***IP masquerading** is a technique that hides an entire IP address space, usually consisting of private IP addresses behind a single IP address in another, usually public address space. The hidden addresses are changed into a single device, so it appears as if it coming from a routing device and not a host. Because of the poppularity of this tecnique with IP masquerading, NAT has become synonymmous with it.

### Basic NAT (one-to-one)

The IP address and all checksums involving the IP address are changed. Basic NAT can be used to interconnect two IP networks that have incompatible addressing.

### One-to-many NAT

For TCP and UDP protocols, the port numbers are changed so that the cobination of IP address and post information on the returned packet can be unambiguously mapped to the corresponding private network destination. Some of the common names used for this are Netowrk Adddress and Port Translation (NAPT), Port Address Translation (PAT), many-to-one NAT. 

This is the most common type of NAT and has been simply called NAT in recent years. NOTE that this is applicable for communication only when the communication originates from the private network.

## Sources:

1. [Understanding TCP/IP addressing and subnetting basic](https://support.microsoft.com/en-in/help/164015/understanding-tcp-ip-addressing-and-subnetting-basics)
1. [Public and Private IP addresses](https://www.lmi.net/support/common/dsl-support/ip-addresses/)
1. [How IP addresses can be repeated](https://superuser.com/questions/745875/if-ip-addresses-are-unique-why-is-it-so-many-routers-have-the-address-192-168-1)
1. [Network Address Translation](https://en.wikipedia.org/wiki/Network_address_translation)
1. [Jio Static IP](https://broadbandforum.co/t/202065/)

