# AWS S3 Introduction
--- 11 June 2021 ---

S3 is storage for the Internet designed to web-scale computing easier. S3 has a 
simple interface that can be used to store and retriece any amount of data, at 
any time, from anywhere on the web. It gives any developer access to the same 
highly scalable, reliable, fast, inexpensive data storage infrastructure that 
Amazon uses to run its own global network of web sites. The service aims to 
maximize benefits of scale and to pass those benefits on to developers.

The Online User Guide describes:
1. How to send requests to requests to create buckets
1. Store and retrieve your object
1. Manage permissions on your resources
1. Access control - defines who can access objects and buckets within S3, and the type of access (READ and WRITE) 
1. Authentication process - verifies the identity of a user who is trying to 
access AWS


## Advantages of S3

1. Creating Buckets
1. Store Data - No caps on Bucket Size, and each Object can be as large 5 TB in 
size
1. Download Data - Anytime and Anywhere
1. Permissions - Control access with authentication mechanisms
1. Standard Interface - REST

## S3 Concepts

### Buckets

A *Bucket* is a container for objects stored in Amazon S3. Every object is 
contained in a bucket. Each object has a URL in the following format

`https://<bucketname>.s3.<region-code>.amazonaws.com/<path-to-object>`

Buckets serve the purpose of:

1. Organize the Amazon S3 namespace at the highest level
1. Identify the account responsible for storage and data transfer charges
1. Play a role in access control
1. Serve as the unit of aggregation for usage reporting


### Objects

*Objects* are the fundamental entities stored in S3. They are the smallest units 
of storage in S3 and consist of *Object data* and *metadata*. Meta-data include 
HTTP headers such as content-type, date-last-modified. Custom metadata can be 
specified.

### Keys

*Keys* are an unique identifier created using "bucket + key + version". Every 
object in S3 can be uniquely addressed through the combination of the web service 
endpoint, bucket name, key and optionally, a version.

For example, in the URL `https://doc.s3.amazonaws.com/2006-03-01/AmazonS3.wsdl`, "doc" is the name of the bucket and "2006-03-01/AmazonS3.wsdl" is the key.

### Regions

Geographical AWS region where the buckets are stored. Can be changed to optimize 
latency, minimize costs, or address regulatory requirements. Objects stored in a 
region never leave the region unless explicitly transferred.

## S3 Data Consistency Model

1. **Read-after-Write Consistency (RAW) -** for PUTs (write new objects and 
overwrite existing objects) and DELETEs of objects
1. **High Availability -** by replicating data across multiple servers
1. S3 Access Control Lists (ACL), S3 Object Tags, and Object metadata are 
strongly consistent

**NOTE:**
- S3 does not suppport object locking for concurrent writers. PUT request 
with latest timestamp rewrites. If required, must be implemented by the 
application.
- Updates are key-based. Dependencies between objects for implementing atomic 
updates across keys must be implemented by the application.

Bucket configurations have an eventual consistency model
- If you delete a bucket and immediately list all buckets, the deleted bucket 
might still appear in the list.
- If you enable versioning on a bucket for the first time, it might take a short 
amount of time for the change to be fully propagated. *Recommendation is to wait 
15 minutes after enabling versioning before issuing write operations (PUT or 
DELETE) on objects in the bucket.*

### Concurrent Applications

Condition 1: When Read occurs after Write. The updated value is read

Condition 2: When Read operation occurs parallely as write. The value read 
is not defined. It could be the old value or updated value.

Condition 3: Simultaneous Write Operations followed by Read. The stored value 
is not defined and depends on which write took place last internally.

## S3 Features

1. Storage Classes
1. Bucket Policies
1. AWS IAM
1. Access Control Lists
1. Versioning
1. Operations

### Storage Classes

S3 offers 3 different storage classes:
- S3 STANDARD - general purpose storage of frequently accessed data
- S3 STADNARD_IA (Infrequent Access) - Long-lived but less frequently accessed 
data
- S3 Glacier - Long term Archive

### Bucket Policies

Bucket policies provide centralized access control to buckets and objects based 
on a variety of conditions: 
- S3 operations
- Requesters
- Resources
- Aspects of the requests (for ex, the IP address requesting the resource)

The policies are expressed in *access policy language* and enable centralized 
management of permissions. It can be used to assign permissions to users based on 
factors such as data being accessed, time of access, and network address. The 
policies can grant permissions either on specific folders (using wildcard 
characters) within the bucket to the users, or simply on individual objects. 

*Only the bucket owner is allowed to associate a policy with a bucket.*

### AWS Identity and Access Management

You can use AWS IAM to manage access to your S3 resources. For example, you can 
use IAM with S3 to control the type of access a user or group of users has to 
specific parts of an Amazon S3 bucket.

### Access Control Lists

You can control access to each of your buckets and objects using an ACL.

### Versioning

You can use versioning to keep multiple versions of an object in the same bucket. 

### Operations

*Common Operations*

- Create a bucket 
- Write an object - Store data by creating or overwriting an object, and specify 
any access control you want on the object
- Read an object 
- Delete an object
- List keys - list the keys, with or without a filter like a prefix



## Pricing

### AWS Free Tier

For a new AWS account, customers receive 5GB of Amazon S3 Storage in the S3 
Standard storage class; 20,0000 GET requests, 2,000 PUT, COPY, POST, or LIST 
Requests; and 15GB of Data Transfer Out each month for one year.

### General Pricing

The pricing is determined by the following factors:

1. Storage
    - depends on objects size, how long you have stored, and the the storage class
    - different slabs (first 50TB/month, next 450TB/Month and so on)

1. Requests & Data retrievals
    - S3 request costs are charges based on the request type and the number of 
    requests ($0.005/1000 requests)

    - DELETE and CANCEL requests are free

    **NOTE:** Although the storage costs of the archives are lower (STANDARD_IA 
    is half, and Glacier is lower by an order of magnitude), the costs of the requests are twice that of STANDARD S3. So, its best to wait to push the data 
    into archive unless you're sure of it.

1. Data transfer
    - You pay for the bandwidth used by S3 when either data is transferred 
    between different regions or data is transferred out from S3 into the Internet

    - You do not pay when data is transferred IN from the internet, transferred 
    between S3 buckets in the same AWS region, data is transferred to another 
    service within the same AWS region, or transferred out to Amazon CloudFront.

    - S3 Transfer Acceleration increases transmission rates and is charged per GB.

1. Management & Analytics
    Any storage management features and analytics are charged 
        - S3 inventory
        - S3 Storage Class Analysis
        - S3 Storage Lens
        - S3 Object Tagging ($0.01 for every 10,000 tags per month)

1. Replication
    Apart from the charges for the additional storage, the PUT requests, 
    inter-region data transfer rates, management and analytics costs, you will 
    also have to pay for S3 Replication Time Control.

1. S3 Object Lambda
    With S3 Object Lambda you can add your own code to S3 GET requests to modify 
    and process data as it is returned to an application. You can use custom code 
    to modify the data returned by standard S3 GET requests to filter rows, 
    dynamically resize images, redact confidential data, and much more.

    These requests are powered by AWS Lambda functions.

    You pay for the cumulative duration and memory allocated to your Lambda 
    function (processing), the S3 GET requests invoked by the Lambda function, 
    and the data 'S3 Object Lambda' returns to your application.

*NOTES:* 
- It's best to figure this out using AWS Pricing Calculator.
- Charges automatically levied from payment method every month end
- Related Services
    - EMR: Processing vast amounts of data using a hosted Hadoop framework
    - Snowball: accelerates transferring large amount of data into and out of 
    AWS using physical storage devices, thus bypassing the internet.


# Sources

1. (Developer User Guide) https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html

Pg. 19

1. (Amazon S3 Pricing) https://aws.amazon.com/s3/pricing/?nc=sn&loc=4