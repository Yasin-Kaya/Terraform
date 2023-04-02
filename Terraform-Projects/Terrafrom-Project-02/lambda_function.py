# lambda_function.py

import boto3
import os

def lambda_handler(event, context):
    s3 = boto3.resource('s3')
    bucket_name = os.environ["BUCKET_NAME"]
    bucket = s3.Bucket(bucket_name)
    bucket.objects.all().delete()
    
    # Check if there are any lingering files
    remaining_objects = list(bucket.objects.all())
    if len(remaining_objects) > 0:
        # Send an SNS notification to the DevOps team
        sns = boto3.client('sns')
        topic_arn = 'arn:aws:sns:us-east-1:XXXXXXXXXXX:XXXXXXXXXXX'  # Write topic_arn defined to your AWS SNS 
        message = f"Found {len(remaining_objects)} lingering objects in S3 bucket {bucket_name}"  
        sns.publish(TopicArn=topic_arn, Message=message)
    else:
        sns = boto3.client('sns')
        topic_arn = 'arn:aws:sns:us-east-1:XXXXXXXXXXX:XXXXXXXXXXX'  # Write topic_arn defined to your AWS SNS 
        message = f"Found {len(remaining_objects)} lingering objects in S3 bucket {bucket_name}"
        sns.publish(TopicArn=topic_arn, Message=message)