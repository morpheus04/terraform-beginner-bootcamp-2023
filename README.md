# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project will utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, e.g. `0.1.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI


### Considerations with th Terraform CLI Changes
The Terraform installation has changed due to gpg keyring changes. So the we needed to refer to latest CLI install instructions

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


[How to Check OS Verision in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:

```sh
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

### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issues, we notice that bash scripts were a considerable amount of code. So we decided to create a bash script to install Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This allows us an easier way to debug and execute Terraform CLI install manually


#### Shebang

A Shebang (pronounced She-bang) tells the bash script what program that will interpret the script e.g. `#!/bin/bash`

ChatGPT recommended the use of `#!/bin/env bash` for:

- portability of different distributions
- search for user's PATH for bash executable



https://en.wikipedia.org/wiki/Shebang_(Unix)



#### Linux Permissions Considerations

```sh
chmod u+x ./bin/install_terraform_cli
```

alternatively:

```sh
chmod 0744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod


### GitHub Lifecycle (Before, Init, Command)

Careful when using **init** as it will not run if restarting existing workspace

https://www.gitpod.io/docs/configure/workspaces/tasks