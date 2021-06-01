# Ideas on how to automate video tagging

## AWS rekognition

- Seems to be a collection of pre-trained models that you can choose to use.

## AWS Lambda

- Set a lambda function that runs on an S3 trigger
- Limited to 250 MB (Numpy = 80MB, PyTorch = 250MB)
- Might require compression and optimization

https://blog.verta.ai/blog/how-to-deploy-ml-models-with-aws-lambda#:~:text=%20How%20to%20Deploy%20ML%20models%20with%20AWS,let%E2%80%99s%20try%20to%20fix%20them%20by...%20More%20

https://medium.com/ixorthink/ml-model-deployment-using-aws-lambda-tips-and-tricks-ca41a7894dff

## ML model deployment Using EFS

- can be added as an external drive to the lambda function
- something called `burst credits`
- might be more expensive

https://medium.com/ixorthink/ml-model-deployment-in-aws-lambda-efs-update-4a0fbfd4e89f

(EFS Burst Credits) https://aws.amazon.com/premiumsupport/knowledge-center/efs-burst-credits/#:~:text=Amazon%20EFS%20uses%20a%20credit%20system%20that%20determines,credits%20at%20the%20same%20rate%20you%20earn%20them.

(AWS - Using EFS with Lambda) https://docs.aws.amazon.com/lambda/latest/dg/services-efs.html

(EFS Performance) https://docs.aws.amazon.com/efs/latest/ug/performance.html

## EC2 instance

- maybe possible to deploy the model on ec2
- set triggers upon put in s3
- run model on object
- output of that, use to tag object

## Setting s3 triggers

https://n2ws.com/blog/aws-automation/lambda-function-s3-event-triggers


## transferring files to s3 using python script

http://www.holovaty.com/writing/amazon-s3-media/