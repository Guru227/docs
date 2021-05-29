# NAT Gateways
--- 29 May 2021 ---

## Routing internet traffic from instances in a private subnet

1. Create a NAT gateway 

    Next, under the same option in the vertical menu, choose `NAT Gateways` and 
    create a NAT gateway. Make sure to select a public subnet for the NAT gateway. 
    Then either choose an elastic IP which is already created or allocate an elastic 
    IP. (You might have to disassociate an elastic IP if its alreadu connected to 
    another virtual device).

1. Configure the Route Tables

    Select the RouteTable for the private subnet, and under `Routes` click on `Edit 
    Routes`. Then, add a new route with a destination `0.0.0.0/0` and set the 
    `target` as the newly created nat gateway on the public subnet.

    This will redirect the traffic from the private subnet directed to the internet
    through the NAT Gateway. This is helpful for setting up internet connections 
    without having to expose the subnet to the internet.

# Sources

1. (Routing internet traffic from instances in a private subnet) 
    - (stack overflow answer) https://stackoverflow.com/questions/67675845/outbound-traffic-from-private-subnet-in-aws 
    - (aws support) https://aws.amazon.com/premiumsupport/knowledge-center/nat-gateway-vpc-private-subnet/
    - (NAT gateway rules) https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html