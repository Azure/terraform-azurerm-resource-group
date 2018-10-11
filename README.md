# terraform-azurerm-resource-group


## Create a basic virtual network in Azure

This Terraform module deploys a Resource Group in Azure.


## Usage

```hcl
module "resourcegroup" {
    source              = "Azure/resource-group/azurerm"
    resource_group_name = "myapp"
    location            = "westus"
   
    tags                = {
                            environment = "dev"
                            costcenter  = "it"
                          }
}

```

## Example adding a vnet in Resource group

```hcl
variable "resource_group_name" { }

module "resourcegroup" {
    source              = "Azure/resource-group/azurerm"
    resource_group_name = "myapp"
    location            = "westus"
   
    tags                = {
                            environment = "dev"
                            costcenter  = "it"
                          }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "myvnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus"
  resource_group_name = "${module.resourcegroup.resource_group_name}"
}

```

## Test

### Configurations

- [Configure Terraform for Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure)

We provide 2 ways to build, run, and test the module on a local development machine.  [Native (Mac/Linux)](#native-maclinux) or [Docker](#docker).

### Native (Mac/Linux)

#### Prerequisites

- [Ruby **(~> 2.3)**](https://www.ruby-lang.org/en/downloads/)
- [Bundler **(~> 1.15)**](https://bundler.io/)
- [Terraform **(~> 0.11.7)**](https://www.terraform.io/downloads.html)
- [Golang **(~> 1.10.3)**](https://golang.org/dl/)

#### Environment setup

We provide simple script to quickly set up module development environment:

```sh
$ curl -sSL https://raw.githubusercontent.com/Azure/terramodtest/master/tool/env_setup.sh | sudo bash
```

#### Run test

Then simply run it in local shell:

```sh
$ cd $GOPATH/src/{directory_name}/
$ bundle install
$ rake build
$ rake e2e
```

### Docker

We provide a Dockerfile to build a new image based `FROM` the `microsoft/terraform-test` Docker hub image which adds additional tools / packages specific for this module (see Custom Image section).  Alternatively use only the `microsoft/terraform-test` Docker hub image [by using these instructions](https://github.com/Azure/terraform-test).

#### Prerequisites

- [Docker](https://www.docker.com/community-edition#/download)

#### Custom Image

This builds the custom image:

```sh
$ docker build --build-arg BUILD_ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID --build-arg BUILD_ARM_CLIENT_ID=$ARM_CLIENT_ID --build-arg BUILD_ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET --build-arg BUILD_ARM_TENANT_ID=$ARM_TENANT_ID -t azure-rg .
```

This runs the build:

```sh
$ docker run azure-rg rake build
```

or

```sh
$ docker run --rm azure-rg /bin/bash -c "bundle install && rake build"
```

This runs the build and full tests:

```sh
$ docker run azure-rg rake full
```

or

```sh
$ docker run --rm azure-rg /bin/bash -c "bundle install && rake full"
```

## Authors

Originally created by [Mikael Krief](http://github.com/mikaelkrief)

## License

[MIT](LICENSE)


# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
