# AWS Certificate Manager (ACM)
--- 09 June 2021 ---

## ACM Pricing

1. Public SSL/TLS certificates (used by your domain name) provisioned through 
AWS Certificate Manager are free. You pay only for the AWS resources you create 
to run your application

1. **AWS Certificate Manager Private Certificate Authority (ACM CA) Pricing**  - 
ACM CA us priced along 2 dimensions. You pay a monthly fee for the operation of 
each private CA until you delete it and you pay for the private certificates you 
issue each month.

**What is a certificate authority?**

A CA is an entity that distributes digital certificates to devices. These 
certificates cryptographically tie an identity to a public key, ensuring that 
individuals online are who they say they are.

Certificate authorities play an integral role in a PKI (public key
infrastructure) and are essential to having a secure network.

**What is a private certificate authority?**

A Private CA aka Enterprise CAs, are self-hosted certificate authorities 
usually meant for internal use only, such as at a large company or university 
and for applications such as Wi-Fi, VPN, or Web Application authentication.

While there is little benefit from a software perspective, the benefit that 
comes from using a private CA is that it limits trust to devices within a 
given organization. This reduces the potential for a breach as with fewer 
devices comes fewer failure points.

One downside to a private CA compared to a public CA, is that the 
infrastructure management and cost fall unto you instead of the usual CA 
vendors. Another factor to weigh is only internal devices will trust these 
CA's. While this is the entire point of a private CA, it's important to 
remember that this is the reason it's only good for internal applications, 
and wouldn't be of much use for external applications like sending an email 
to someone outside your organization.

## Requesting a public SSL certificate

1. Login to the AWS Console and open the Certificate Manager

1. Click on `Request a certificate`

1. Select the `request a public certificate` and proceed to the next step

1. Add domain names. Use an asterish to request a wildcard certificate to protect 
several sites in the same domain. You can add multiple domain names to be covered 
under this certificate.

1. Validate using one of the two options `DNS Validation` or `email validation`
    
    In *DNS Validation*, ACM provides you with one or more CNAME records that 
    must be added to this database. These records contain a unique key-value pair 
    that serves as proof that you control the domain.

    For example, if you request a certificate for the `example.com` domain with 
    `www.example.com` as an additional name, ACM creates two CNAME records for 
    you. Each record, created specifically for your domain and your account, 
    contains a name and a value. The value is an alias that points to an AWS 
    domain that ACM uses to automatically renew your certificate. The CNAME 
    records must be added to your DNS database only once. ACM automatically 
    renews your certificate as long as the certificate is in use and your CNAME 
    record remains in place.

    NOTE: email validation should be manually renewed every 825 days.

1. Add necessary tags

1. Review and then finally validate using your method



# Sources

1. (ACM Pricing) https://aws.amazon.com/certificate-manager/pricing/#:~:text=AWS%20Certificate%20Manager%20Pricing%201%20AWS%20Certificate%20Manager,30-day%20Free%20Trial.%20...%204%20Pricing%20examples.%20

1. (CA's and Private CA's) https://www.securew2.com/blog/creating-private-certificates#:~:text=What%20is%20a%20Private%20Certificate%20Authority%3F%20Private%20CAs%2C,such%20as%20Wi-Fi%2C%20VPN%2C%20or%20Web%20Application%20authentication.

1. (DNS Validation) https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html

1. (e-mail Validation) https://docs.aws.amazon.com/acm/latest/userguide/email-validation.html