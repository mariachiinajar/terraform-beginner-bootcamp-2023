# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilise semantic versioning for its tagging.  
[semver.org](https://semver.org/)  
Given a version number **MAJOR.MINOR.PATCH**, increment the:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes  

<br>

## Install the Terraform CLI

### Considerations with the Terraform CLI changes

The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Considerations for Linux Distribution

This project is built against Ubuntu. Please consider checking your Linux distribution to see if you require any change accordingly to your distribution needs. 

[How To Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:

```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

<br>

### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg deprecation issues, we noticed that the bash scripting steps were a considerable amount of more code. So we decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli]

- This will keep the Gitpod Task File ([gitpod.yml](gitpod.yml)) tidy. 
- This will allow us to debug more easily and execute Terraform CLI instll manually. 
- This will allow better portability for other projects that need to install Terraform CLI. 

<br>

### Shebang Considerations

A Shebang (prounced Sha-bang) tells the bash script what program that will interpet the script. eg. #!/bin/bash

ChatGPT recommended this format for bash: #!/usr/bin/env bash

for portability for different OS distributions
will search the user's PATH for the bash executable
https://en.wikipedia.org/wiki/Shebang_(Unix)

<br>

### Execution Considerations

When executing the bash script we can use the ./ shorthand notiation to execute the bash script.

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to a program to interpert it.

eg. `source ./bin/install_terraform_cli`

<br>

### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for the fix to be exetuable at the user mode.

```chmod u+x ./bin/install_terraform_cli```

alternatively:

```chmod 744 ./bin/install_terraform_cli```

### Github Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

[Configure gitpod workspaces](https://www.gitpod.io/docs/configure/workspaces/tasks)

### Working with Env vars

We can list out all Environment variables (env vars) using the `end` command.   
We can filter specific env vars using grep, eg. `env | grep AWS_`  

#### Setting and unsetting env vars

In the terminal we can set using `export HELLO=world`   
Unset the variable using `unset HELLO`  

We can set an env var temporarily when just running a command. 

```
HELLO='world' ./bin/print_message
```

Within a bash script we can set env without writing export eg.

```
HELLO='world'
```

#### Printing vars 

We can print an env var using echo eg. `echo $HELLO`


#### Scoping of env vars

When you open up new bash terminals in VScode it will not be aware of env vars that you have set in another window. 

If you want to Env vars to persist across all future bash terminals that are open, you need to set env vars in your bash profile. eg `.bash_profile`

#### Persisting Env vars in Gitpod

We can persist env vars into Gitpod by storing them in Gitpod Secrets Storage. 

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.   
You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive values.

<br>

### AWS CLI Installation

AWS CLI is installed for the project via the bash script ./bin/install_aws_cli

[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)   
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:

```aws sts get-caller-identity```

If it is succesful you should see a json payload return that looks like this:

```
{
    "UserId": "AIEAVUO15ZPVHJ5WIJ5KR",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```
We'll need to generate AWS CLI credits from IAM User in order to the user AWS CLI.

<br>

# Issue #9 Terraform random bucket name

**Terraform Registry**

Terraform sources their providers and modules from the Terraform registry which is located at [registry.terraform.io](https://registry.terraform.io/).

**Difference between Provider and Module** 
- Providers are the direct interfaces to APIs; modules are templates. 
- **Provider**: Cloud service provider that you directly interact with via Terraform. It is an interface to APIs that will allow to create resources in terraform.
  - Examples: AWS, Azure, GCP, Kubernetes, Oracle Cloud Structure
- [**Module**](https://developer.hashicorp.com/terraform/language/modules): Modules are containers for multiple resources that are used together. A module consists of a collection of `.tf` and/or `.tf.json` files kept together in a directory. Modules are the main way to package and reuse resource configurations with Terraform. 

- [Official Terraform Registry](https://registry.terraform.io/)
- [More on Terraform `random` provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs)
- [Terraform AWS documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

#### `terraform init`

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project. 

#### `terraform plan`

Generates an overview bill of what is going to change from the current set of resources.

#### `terraform apply`

Applies the changes planned in the `terraform plan`, meaning the command executes the provisioning of the resources.
- In Andrew's words: this will run a plan and pass the changeset to be executed by terraform. `apply` will prompt yes or no. 
- For automatic approval to execute the `apply` without entering yes, use the tag `--auto-approve`.

#### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.

The Terraform Lock File should be committed to your Version Control System (VSC) eg. Github

<br>

#### Terraform State Files

- `.terraform.tfstate` contain information about the current state of your infrastructure. 

- This file **should not be committed** to your VCS. This file can contain sensitive data. If you lose this file, you lose the knolwedge of the state of your infrastructure.

- `.terraform.tfstate.backup` is the previous state file state. 

#### Terraform Directory

- `.terraform` directory contains binaries of terraform provider. 

<br>

#### **Terraform Commands**

**Main commands:**
- `init`          Prepare your working directory for other commands  
- `validate`      Check whether the configuration is valid  
- `plan`          Show changes required by the current configuration  
- `apply`         Create or update infrastructure  
- `destroy`       Destroy previously-created infrastructure  

**All other commands:**
- `console`       Try Terraform expressions at an interactive command prompt 
- `fmt`           Reformat your configuration in the standard style  
- `force-unlock`  Release a stuck lock on the current workspace  
- `get`           Install or upgrade remote Terraform modules  
- `graph`         Generate a Graphviz graph of the steps in an operation  
- `import`        Associate existing infrastructure with a Terraform resource  
- `login`         Obtain and save credentials for a remote host  
- `logout`        Remove locally-stored credentials for a remote host  
- `metadata`      Metadata related commands  
- `output`        Show output values from your root module  
- `providers`     Show the providers required for this configuration  
- `refresh`       Update the state to match remote systems  
- `show`          Show the current state or a saved plan  
- `state`         Advanced state management  
- `taint`         Mark a resource instance as not fully functional  
- `test`          Experimental support for module integration testing  
- `untaint`       Remove the 'tainted' state from a resource instance  
- `version`       Show the current Terraform version  
- `workspace`     Workspace management  

<br>

#### Change set

`terraform plan`
- The comparison between the current state of the resources and the changes that will be made to the resources

<br>

## References
- `chmod`: https://en.wikipedia.org/wiki/Chmod
- `shebang`: https://en.wikipedia.org/wiki/Shebang_(Unix)
- `gitpod workspaces`: https://www.gitpod.io/docs/configure/workspaces/tasks
