# DNS Configuration

After buying a domain name, you will have to setup the individual records and 
make them point to different servers. This is done by setting up various DNS 
records. 

The DNS will then, upon receiving a request to be routed to a particular host, 
will redirect the client to the particular IP address.

## DNS Record types

1. A Record - An A record (Address Record) maps a domain name to the IPv4 of the 
computer hosting the domain. An A record uses a domain name to find the IP 
address of a computer connected to the internet.

You can have multiple A records for the same domain in order to provide 
redundancy and fallbacks. 

Additionally, multiple names could point to the same address, in which case each 
would have its own A record pointing to that same IP address.

**Note: ** The record for `slamdunk.ai` and `www.slamdunk.ai` are different and 
must have different A records.

**Note: ** `@` is the symbol to indicate that this is a record for the root domain

1. AAAA record - It's the same as an A record, but for IPv6 records.

1. CNAME Record - (Canonical Name Record) is used in lieu of an A record when a 
domain or subdomain is an alias of another domain. All CNAME records point to a 
domain, never to an IP address. 

**NOTE: ** The CNAME record only points the client to the same IP address as the 
root domain it points to, but this is not the case. The CNAME records only points 
the client to the same IP address as the root domain. Once the client hits that 
IP address, the web server will still hanfdle the URL accordingly. So for 
instance, `blog.example.com` might have a CNAME that points to `example.com`, 
directing the client to `example.com`'s IP address. But, when the client actually 
connects to that IP address, the web server will look at the URL, see that it is `blog.example.com`, and deliver the blog page rather than the home page.


|blog.example.com | Record type | Value | TTL |
| --- | --- | --- | --- |
| @ | CNAME | blog.example.com | 32600 |

### Time To Live (TTL) and DNS caching

`Time to Live` is used for computer data including DNS servers. It is the number 
of iterations or transmissions in computer and computer network technology that a 
unit of data can experience before it should be discarded.

With respect to the DNS, `TTL` value tells local resolving name servers how long 
a record should be stored locally before a new copt of the record must be 
retrieved from DNS. The records storage is known as the `DNS cache`, and the act 
of storing records is called `caching`.

1. TTLs are set by an authoritative nameserver for each resource record
1. TTLs are used for caching purpose
1. Caching speeds up name resolving

*When should you set shorter TTLs?* - It makes sense to set shorter TTLs to 
reduce disruptions when changing the addresses of critical services like web server or MX records (mail server pointers).

# Source

1. (`A records`) https://support.dnsimple.com/articles/a-record/
1. (`@` and `AAAA records`) https://www.cloudflare.com/en-gb/learning/dns/dns-records/dns-a-record/
1. (`CNAME Records`) https://www.cloudflare.com/en-gb/learning/dns/dns-records/dns-cname-record/
1. (TTL and DNS Caching) https://www.dnsknowledge.com/whatis/time-to-live-ttl/#:~:text=TTL%20and%20DNS%20Caching%201%20TTL%20is%20part,speed%20up%20name%20resolving%20by%20caching%20results%20locally.