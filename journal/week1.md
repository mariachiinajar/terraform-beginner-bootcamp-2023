# Terraform Beginner Bootcamp 2023 - Week 1

## Table of Contents

- [Week 1 Live stream](#week-1-live-stream)
  - [Week 1 Live agenda](#week-1-live-stream-agenda)
- [Journal TOC and Major Version](#)
  - [Journal TOC and Major Version - Medium Blog](https://medium.com/@gwenleigh/terraform-cloud-project-bootcamp-with-andrew-brown-journal-toc-and-major-version-for-good-33a9084a3d47)

<br>

## Week 1 Live stream

- If you are looking all the commands used throughout this week's stream, here is the cheat sheet for you!

```
# install http-server globally.
npm install http-server -g

# start the http-server.
http-server 

# Upload a single file
aws s3 cp public/index.html s3://YOUR_BUCKET_NAME/index.html

# Upload a folder with multiple files
aws s3 sync public s3://YOUR_BUCKET_NAME

# Check CloudFront list of OACs 
aws cloudfront list-origin-access-controls
aws cloudfront list-origin-access-controls --output table

aws cloudfront list-cloud-front-origin-access-identities


# Bucket policy

{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::nomadiachi-in-terratown-bucket/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::AWS_ACCOUNT_ID:distribution/DISTRIBUTION_ID"
                }
            }
        }
    ]
 }
```

### Week 1 Live stream Agenda

- ✅ 1. Create an S3 bucket to store your static website & enable the S3 bucket for static website hosting.
- ✅ 2. Prepare a simple html template for static website hosting.
- ✅ 3. Create a CloudFront distribution and tweak around the configuration to host your static html website.

The detailed documentation with fancy schmancy full-colour screentshots available at [my Medium blog post](https://medium.com/@gwenleigh/terraform-cloud-project-bootcamp-with-andrew-brown-week-1-live-streaming-d22e2c6ef5e)

<br>

<br>

### Journal TOC and Major Version

we restructured the giant README.md file into more smaller chunks so it’s easier to understand the structure.

- [Simpler README.md](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/tree/19-create-toc-readme)
- [Weekly journals in journal folder](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/tree/main/journal)
- [Weekly journal with Table of Content (TOC)](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/blob/main/journal/week0.md)

You can compared the difference by comparing the [new documentation](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/tree/19-create-toc-readme) against the [old version](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/tree/18-week-1-livestream-cloudfront-s3-static-website-hosting).

<br>
