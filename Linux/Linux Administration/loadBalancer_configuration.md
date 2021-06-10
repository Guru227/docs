# Load balancers in AWS
--- 10 June 2021 ---


There are 3 types of load balancers:
1. Application Load Balancer - 
1. Network Load Balancer
1. Gateway Load Balancer

## How load balancers work
The DNS will route the client to the load balancer. So the various URLs 
that are to be supported by the load balancer all point to the load balancer in 
the form of CNAME records. Use the DNS Name of the Load Balancer (A record) as 
the CNAME record on your DNS Panel.

For each load balancer, you can setup `Listeners` for each protocol:port 
combination. Depending on the request being made on this port, the request 
will be redirected to a `Target Group`. A `Target Group` is a group of instances 
that are grouped together to share the load of a particular task.

The `Listener` will determine which target group should receive the request 
depending on the rules set within the Listener. These rules are abstracted as  
simple *If-then* clauses which can categorize the incoming data based on the query string, host, source IP, HTTP request methods, HTTP Headers and Path.
Depending on the if clause that it satisfies, the incoming data is forwarded to 
the corresponding target group.


## Creating an application load balancer

### Pre-requisites 

1. Create a certificate from AWS Certificate Manager (ACM)

### Configuring the load balancer

1. Under EC2, go to load balancers and select `create load balancer`

1. Select `Application Load Balancer`

1. Give your load balancer a name. The convention is to suffix the name with '-lb'

1. It's likely to be an internet facing lb, so choose that.

1. Leave it as IPv4 address type unless you would also want to support IPv6

1. Add a HTTPS listener in addition to the HTTP listener

1. Select the VPC and configure it to use atleast two availability zones on the 
public subnet.

### Configure Security Settings

1. `Choose a certificate from ACM` and then select the certificate that you have 
already generated using ACM. You can leave the security policy to be the default.
In my case, it is `ELBSecurityPolicy-2016-08`.

### Create a Security Group

1. Create a new security group, and listen to two ports 80 & 443.

### Configure Routing

Here is where you configure the name of the `target group`. The protocol used 
over here is the protocol used by the load balancer to communicate with the 
instance. It's usually just HTTP, port 80.

1. Give this a name, Leave the rest of it as default. 

### Register targets

If you register a target in an enabled Availability Zone, the load balancer 
starts routing requests to the targets as soon as the registration process 
completes and the target passes the initial health checks.

1. Add the instance(s) that you want to be targeted by the load balancer



## Add Listener Rules

After creating the load balancers and the target groups, you need to create the 
Rules for each port that is being listened to. These rules are abstracted as  
simple *If-then* clauses which can categorize the incoming data based on the query string, host, source IP, HTTP request methods, HTTP Headers and Path.
Depending on the if clause that it satisfies, the incoming data is forwarded to 
the corresponding target group.

1. Click on `View/edit Rules` on the port you would like to configure. Add a rule.
And then set the conditions you would like to use.

1. `Host` in the *if* clause refers to the hostname that the client request was 
directed to. It is the website URL that the user typed into his/her browser.

1. In the *then* clause, when its corresponding *if* clause is satisfied, you can **forward** the data to the target group, the group of instances that are 
expected to handle the request.


# Sources

1. AWS Console

