# VPC

VPC in GCP is much like in AWS - it forms the basis for most of the networking within. If you're familiar enough with networking concepts, and have maybe splashed around in AWS's VPC and networking, or some other SDN framework, the basics of GCP's VPC service will come easily. There are a few key differentiators that will be addressed below.

## VPC Peering
VPC Peering is the act of connecting one VPC to another. If you are familiar with AWS VPC, VPC Peering works pretty much the same way here. Peering in GCP, much like in AWS, is non-transitive. This means that if you have a hub-and-spoke network architecture, your spokes cannot communicate with each other. In order to facilitate this, you will need to make use of Cloud Router (covered later).
## Firewall and Network Tags
Firewall and network tags can be thought of as the equivalent of AWS's Security Group concept. Instances and networked resources can be tagged and have rules applied to them based on their membership of these Network Tags.
## Shared VPC
A somewhat unique feature of GCP networking is the ability to create compute resources that belong to one project within a network owned by another project. This allows for a single project to form the basis for networking across an entire solution, and removes potentially frustrating issues that may be encountered were you to approach this via VPC Peering, for instance.
## Cloud Router

## Private Google Access
Private Google Access is comparably to VPC endpoints in AWS at a high level, but differs somewhat due to their ability to be transitive across perimeter boundaries (?)

## VPC Security Controls (VPC SC)
