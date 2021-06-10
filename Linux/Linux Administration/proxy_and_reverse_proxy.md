# Proxy Servers and Reverse Proxy Servers
--- 09 June 2021 ---

## Proxy Servers

A proxy server is any machine that translates traffic between networks or 
protocols. It's an intermediary server seperating end-user clients from the 
destinations that they browse. Proxy server provide varying levels of 
functionality, security, and privacy depending on your use case, needs, or 
company policy.

If you're using a proxy server, traffic flows through the proxy server on its 
way to the address you requested. The request then comes back through that same 
proxy server (there are some exceptions to this rule), and then the proxy server 
forwards the data received from the website to you.

Proxy servers provide better data security and network performance. They act as 
a firewall and web filter, provide shared network connections, and cache data to 
speed up common requests. A good proxy server keeps users and the internal 
network protected from the bad stuff that lives out in the wil internet. Lastly, 
proxy server can provide a high level of privacy.

### How it works?

Each web request sent from the client is forwarded onto the proxy server. The 
proxy server then makes your web request on your behalf, collect the response 
from the web server, and forwards you the web page data so you can see the page 
in your browser.

A proxy server might mangle your packets IP address, encrypt your data and block 
access to certain web pages based on IP address.

### Forward Proxies

A forward proxy server sits between the client and an external network. It 
evaluates the outbound requests and takes action on them before relaying that 
request to the external resource.

Most proxy services are forward proxies. VPN's and web content filters are both 
examples of forward proxies.

### Reverse Proxies

A reverse proxy server sits between a network and multiple other internal 
resources. A large website might have dozens of servers that collectively serves 
requests from a single domain. To accomplish that, client requests would resolve 
to a machine that would act as a load balancer. The load balancer would then 
proxy that traffic back to the individual servers.

# Sources

1. (Proxies and reverse proxies) https://www.varonis.com/blog/what-is-a-proxy-server/#:~:text=A%20proxy%20server%20is%20basically%20a%20computer%20on,your%20request%20goes%20to%20the%20proxy%20server%20first.