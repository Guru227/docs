--- AWS ---
# Creating an EC2 instance

1. Open aws Console. Under Services, choose EC2.

2. On the menu-panel on the left, select instances. In the opened window, click on launch instance.

3. Choose preferred Amazon Machine Instance (AMI). Here, I'll be choosing Ubuntu 18.04 LTS with 64 bit (x86) option chosen.

4. Choose the instance type you'd like to use. I'll be choosing t2.micro.

5. Click on review and launch. Then, edit security groups. Add one rule for ssh and another for http. You can change this later.

6. Next, in the review and launch page, edit storage and add/remove storage as required. I won't be setting any storage. You can change this later. Click on Launch.

7. If you already have a key-pair, you can choose that. Else, create a new key-pair, name it, and download the private key file. This will be required for ssh-ing into your ec2 instance. Then, click on launch instance.

8. You can now see your instance under the instances dashboard with its instance state as 'active'.

9. Now, you can ssh into your ec2 instance. You will require
	- the downloaded key-pair
	- ssh client on local machine (openssh) <br>
	- Your instance's public DNS id. 

10. Now, use the following command:
>	
	```
	ssh -i /path/my-key-pair.pem my-instance-user-name@my-instance-public-dns-name
	```
>**Note:** If you receieve a similar error, it's possible your permissions for the .pem file aren't set properly. 
>
>	
	```
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	Permissions 0664 for 'aws_instance_test.pem' are too open.
	It is required that your private key files are NOT accessible by others.
	This private key will be ignored.
	Load key "aws_instance_test.pem": bad permissions
	guru@ec2-54-209-27-18.compute-1.amazonaws.com: Permission denied (publickey).
	```
> In such a case, make it a read only file using the following command.	
>
	```
	chmod 400 aws_instance_test.pem
	```
> **Note:** The default `ec2-user-name` for the instance could be `root`, `ubuntu` or `ec2-user`. Use the appropriate username, else the connection will close. <br>
<br>
> **Note:** In my, case, the following commands were used.
> 
	```
	chmod 400 aws_instance_test.pem
	ssh -i aws_instance_test.pem ubuntu@ec2-54-209-27-18.compute-1.amazonaws.com
	```
> And the following output was seen:
> 
	```
	Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)
	...
	```

10. Use `exit` to terminate the connection
	
11. To share a file with your ec2 instance from your local machine, share using scp:
	```
	scp -i aws_instance_test.pem /file/path ubuntu@ec2-54-209-27-18.compute-1.amazonaws.com:~
	```

<br>		
**Final Note:** You will be billed for any active instances. You can stop any instance, or even terminate it, by going to the instances dashboard. You will not be billed for stopped instances. But you will be billed for EBS or S3 storage volumes attached to your instances. Volumes can be managed in `Volumes` under `Elastic Block Store` (found in the left-menu panel).


## Sources

1. [AWS documentation (main)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html)

1. [Creating user accounts in EC2 instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/managing-users.html)

1. [User permissions for private key](https://stackoverflow.com/questions/29933918/ssh-key-permissions-0644-for-id-rsa-pub-are-too-open-on-mac)

1. [Other possible reasons for being unable to connect](https://stackoverflow.com/questions/16992848/aws-ec2-connection-closed-by-when-trying-ssh-into-instance)

1. [Billing clarification](https://intellipaat.com/community/3186/do-you-get-charged-for-a-stopped-instance-on-ec2)

	
	
