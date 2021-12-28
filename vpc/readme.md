# VPC

VPC in GCP is much like in AWS - it forms the basis for most of the networking within. If you're familiar enough with networking concepts, and have maybe splashed around in AWS's VPC and networking, or some other SDN framework, the basics of GCP's VPC service will come easily. There are a few key differentiators that will be addressed below.

## VPC Peering
VPC Peering is the act of connecting one VPC to another. If you are familiar with AWS VPC, VPC Peering works pretty much the same way here. Peering in GCP, much like in AWS, is non-transitive. This means that if you have a hub-and-spoke network architecture, your spokes cannot communicate with each other. In order to facilitate this, you will need to make use of Cloud Router (covered later).
## Firewall and Network Tags
Firewall and network tags can be thought of as the equivalent of AWS's Security Group concept. Instances and networked resources can be tagged and have rules applied to them based on their membership of these Network Tags.
## Shared VPC
A somewhat unique feature of GCP networking is the ability to create compute resources that belong to one project within a network owned by another project. This allows for a single project to form the basis for networking across an entire solution, and removes potentially frustrating issues that may be encountered were you to approach this via VPC Peering, for instance.
## Cloud Router

## Private Google Access/Private Service Connect/Private Services Access
These three options within VPC configuration are all similar enough to cause confusion, in both name and purpose, as well as being commonly used. 
### Private Google Access
Private Google Access allows virtual machines without public addresses to access Google APIs via their public endpoints despite not having an Internet Gateway or NAT mapping to support this. This is done without traversing the public internet, instead using the GCP network backbone to access them.

### Private Service Connect
Private Service Connect is comparable to VPC endpoints in AWS at a high level, but differs somewhat due to their ability to be transitive across perimeter boundaries - you can use this to expose services within a VPC, connect across VPCs, as well as use it to access and consume Google Cloud API services. Additionally, VPC Service Controls can be applied to all of these, as can network firewall rules.

A great example of PSC is to enforce regionality - resources in one Google region will consume APIs via an endpoint that is located in the same region as them.
### Private Services Access
Private Services Access allows you to allocate an unused CIDR block for Google Services if you want them to remain private - no public IP addresses for these! This results in the creation of a Google managed VPC (service VPC) that uses the provided IP range. This is peered with your target VPC to facilitate traffic between the two.

Because these are two separate VPCs, it is important to understand that the only routes shared between them by default are at the subnet level - if you have on-premise or other networks that you want to route to these private services from, you need to have routes to these present in your original VPC as well as export them to the service VPC
## VPC Security Controls (VPC SC)
