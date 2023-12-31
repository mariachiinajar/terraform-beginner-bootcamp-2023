# Terraform Beginner Bootcamp 2023

![Our Terra Town architecture](https://user-images.githubusercontent.com/7776/268042721-ab015431-2d14-4910-aa37-be4807b2b905.png)
Our Terra Town architecture

<br>

## Weekly Journals

- [Week 0 Journal](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/blob/main/journal/week0.md)
- [Week 1 Journal](https://github.com/mariachiinajar/terraform-beginner-bootcamp-2023/blob/main/journal/week1.md)

<br>

## Resources

### Week 1
- [Github Markdown TOC Generator](https://ecotrust-canada.github.io/markdown-toc/)
- [Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- [Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Import](https://developer.hashicorp.com/terraform/cli/import)
- [S3 bucket import](registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)
- [Terraform Import](registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string#import)

### Modules
- [Modules](developer.hashicorp.com/terraform/language/modules/develop/structure)
- [Module sources](developer.hashicorp.com/terraform/language/modules/sources)

### Static Website Hosting
- [Resource: `aws_s3_bucket_website_configuration`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)
- [Resource: `s3_bucket_object`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object)
- [Fileexists](https://developer.hashicorp.com/terraform/language/functions/fileexists)
- [Filemd5](https://developer.hashicorp.com/terraform/language/functions/filemd5)

## 1 5 0 Content Delivery Network
- [Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)
- [Data Source: aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)
- [Locals](https://developer.hashicorp.com/terraform/language/values/locals)

## 1 8 0 Assets Upload For Each
- [The for_each Meta-Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)

## 1 8 3 Tag - Fixed validation issues

`Tag 1.8.3` does not exist in Andrew's repo. This is my unique tag which I tagged after fighting through a set of Week 1 validation issues. 
Major issues that's now fixed with `tag 1.8.3`:  
- `domain_name` was changed from `bucket_domain_name` to `bucket_regional_domain_name`.
- Invalidations: this was a manual process and did not lead to any code change. 

<br>

## References
- `chmod`: https://en.wikipedia.org/wiki/Chmod
- `shebang`: https://en.wikipedia.org/wiki/Shebang_(Unix)
- `gitpod workspaces`: https://www.gitpod.io/docs/configure/workspaces/tasks