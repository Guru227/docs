# Ideas on how to automate video tagging

## AWS rekognition

- Seems to be a collection of pre-trained models that you can choose to use.

## AWS Lambda

- Set a lambda function that runs on an S3 trigger
- Limited to 250 MB (Numpy = 80MB, PyTorch = 250MB)
- Might require compression and optimization

## ML model deployment Using EFS

- can be added as an external drive to the lambda function
- something called `burst credits`
- might be more expensive

## EC2 instance

- maybe possible to deploy the model on ec2
- set triggers upon put in s3
- run model on object
- output of that, use to tag object