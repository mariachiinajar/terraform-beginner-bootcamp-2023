# Terraform Beginner Bootcamp 2023 - Week 1

## Table of Contents

- [Week 1 Live stream](#week-1-live-stream)
  - [Week 1 Live agenda](#week-1-live-stream-agenda)
- [Journal TOC and Major Version](#journal-toc-and-major-version)
  - [Journal TOC and Major Version - Medium Blog](https://medium.com/@gwenleigh/terraform-cloud-project-bootcamp-with-andrew-brown-journal-toc-and-major-version-for-good-33a9084a3d47)
- [Root Module Structure](#root-module-structure)
  - [Loading Terraform Input Variables](#loading-terraform-input-variables)
    - [`var` flag](#var-flag)
    - [`var-file` flag](#var-file-flag)
    - [`terraform.tfvars`](#terraformtfvars)
    - [`auto.tfvars`](#autotfvars)

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

## Journal TOC and Major Version

we restructured the giant README.md file into more smaller chunks so it’s easier to understand the structure.

- [Simpler README.md](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/tree/19-create-toc-readme)
- [Weekly journals in journal folder](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/tree/main/journal)
- [Weekly journal with Table of Content (TOC)](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/blob/main/journal/week0.md)

You can compared the difference by comparing the [new documentation](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/tree/19-create-toc-readme) against the [old version](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/tree/18-week-1-livestream-cloudfront-s3-static-website-hosting).

<br>

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
├── variables.tf      # stores the structure of input variables
├── providers.tf      # defined required providers and their configurations
├── outputs.tf        # stores the outputs
├── terraform.tfvars  # the data of variables we want to load into our terraform project.
├── main.tf           # everything else
└── README.md         # required for root modules
```

Manually generate the files using the following commands. 

```
code outputs.tf
code providers.tf
code terraform.tfvars
code variables.tf
```

### Terraform Cloud Variables

In terraform, we can set two kinds of variables:
- Environmental variables: those you set in your bash terminal such as AWS credentials.
- Terraform variables: those that you normally set in your `tfvars` file. 

We can set Terraform Cloud variables to be sensitive so they are not visibly displayed in the UI. 

### Loading Terraform Input Variables

### [`-var` flag](https://developer.hashicorp.com/terraform/language/values/variables#variables-on-the-command-line)

We can use the `-var` flag to set an input variable or override a variable in the `tfvars` file such as `terraform -var user_uuid=0000-...`  

This will override the pre-defined varible in other files. 

```
terraform apply -var="user_uuid=hell_user_uuid1234567"
```

### [`-var-file` flag](https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files)

If you have multiple variables that you have to use on the fly in the command lines, it is more convenient to feed them in bulk. Define all the variables in a single file (either in `.tfvars` or `.tfvars.json`), then specify the file path as the valu for the `-var-file` flag.

```
terraform apply -var-file="bulkvalues.tfvars"
```

### [`terraform.tfvars`](https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files)

This is the default file to load in terraform variables in bulk.

### `auto.tfvars`

Terraform automatically loads a number of variable definitions files if they are present. This list also indicates the precedence of files from top to bottom and from left to right: 

- Any `*.auto.tfvars` or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
- Any files with names ending in `.auto.tfvars` or `.auto.tfvars.json`
- Files named exactly `terraform.tfvars.json` or `terraform.tfvars`

<br>

## Resources 
- [Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- [Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)