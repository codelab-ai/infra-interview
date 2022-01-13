# aws-terraform-vpc

Terraform module to manage VPC.

This module aims to manage single security group. Each security group will have following features:

- Create VPC with CIDR range
- Create subnets including private and public subnets with various AZs
- Create NAT gateway and put it in public subnet
- Create Internet Gateway and attached to public subnet
- Create routing table for all subnets

For detailed documentation on each input/output of this module, see the auto-generated [variables_and_outputs.md](docs/variables_and_outputs.md)

## Documentation

To generate documentation of outputs/variables, run:

`
$ make docs
`

Document should be generated before commit your code, it's important for others to read your code.

## Requirements

* terraform (0.14)
* terraform-docs

## Versioning

Our purpose is to make sure changes will be tracked by versioning and CHANGELOG. We will use git tag for versioning of module, when there is a change for the module, we will need to manually update `version` file to increase the version. In the future, we should use CI pipeline to do the tagging. See `CHANGELOG.md` file for detail of versioning strategy we should use.

Right now we don't have versioning enabled yet because we're in early phase of development, we need to make it fast.
