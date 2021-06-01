# IP Addresses in AWS

## Subnets

**NOTE: ** You can have upto 252 addresses on /24 subnet. 4 addresses are 
reserved - broadcast, subnet address

## Elastic IP addresses

Elastic IP addresses are static IP addresses that can be assigned to instances or 
network interfaces. The IP address can be created, associated to an instance,
then disassociated, and then reassociated to the same or another instance. You 
can create an elastic IP in the VPC menu or the EC2 menu. There might be other 
places where you can create it.

Each AWS account can have 5 Elastic IP addresses. To reserve more than 5, you 
will need to submit a request.

# Source

1. (subnets and elastic ip) https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html